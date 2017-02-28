class ImportDevice
  attr_reader :params

  def initialize params, current_user_id
    @params = params
    @current_user_id = current_user_id
    @list_device = Device.all.to_a
    @list_device_category = DeviceCategory.all.to_a
    @list_invoice = Invoice.all.to_a
    init_device_group
    list_assigment = {}
    @list_import_device = []
    @list_import_invoice = []
    @list_import_device_category = []
    @list_assigment = []
  end

  def import_device
    spreadsheet = open_spreadsheet @params[:file]
    if spreadsheet.present?
      header = spreadsheet.row(Settings.import.first_row)
      (Settings.import.start_row..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        new_device = init_import_device row
        if new_device.present?
          add_to_list_import new_device, row
        end
      end

      if @list_import_device.count > 1
        Device.import @list_import_device
        create_assigment
      end
    end
  end

  def open_spreadsheet file
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path)
      when ".xls" then Roo::Excel.new(file.path)
      when ".xlsx" then Roo::Excelx.new(file.path)
      else return nil
    end
  end

  def init_import_device row
    row_device_code = row[Settings.column_file.import_device.device_code]
    device_category = init_device_category row_device_code
    ranger_device_code = get_ranger_device_code row_device_code
    if ranger_device_code > 0
      start_ranger = get_start_ranger_device_code row_device_code
      for i in start_ranger..start_ranger + ranger_device_code
        new_code = render_new_device_code i
        device_code = "#{device_category.template_code}#{new_code}"
        if check_exist_Device device_code
          add_to_list_import init_device(row, device_category, device_code), row
        end
      end
    else
      if check_exist_Device row_device_code
        new_device = init_device row, device_category, nil
      end
    end
    new_device
  end

  def check_exist_Device device_code
    exist_device = @list_device.detect{|w| w[:device_code] == device_code}
    imported_device = @list_import_device.detect{|w| w[:device_code] == device_code}
    exist_device.nil? && imported_device.nil?
  end

  def init_device row, device_category, device_code
    device_code ||= row[Settings.column_file.import_device.device_code]
    if device_code.present?
      device_status = Settings.device_status.using
      unless row[Settings.column_file.import_device.last_using_by].present?
        device_status = Settings.device_status.available
      end
      invoice = init_invoice(row[Settings.column_file.import_device.invoice])
      if invoice.present?
        invoice_id = invoice.id
      end

      new_device = Device.new device_code: device_code,
        production_name: row[Settings.column_file.import_device.production_name],
        model_number: row[Settings.column_file.import_device.model_number],
        serial_number: row[Settings.column_file.import_device.serial_number],
        device_status_id: device_status,
        device_category_id: device_category.id,
        invoice_id: invoice_id,
        description: row[Settings.column_file.import_device.description],
        created_by: @current_user_id,
        updated_by: @current_user_id
     end
  end

  def add_to_list_import device, row
    if device.present?
      @list_import_device << device
      @list_assigment << {device_code: device.device_code,
        email: row[Settings.column_file.import_device.last_using_by]}
    end
  end

  def get_ranger_device_code device_code
    ranger = 0
    if device_code.present?
      split_device_code = device_code.split("_")
      if split_device_code.count > 1
        ranger_split = split_device_code[split_device_code.count - 1].split("-")
        if ranger_split.count == 2
          begin
            start_ranger = ranger_split[0].to_i
            end_ranger = ranger_split[1].to_i
            ranger = start_ranger - end_ranger
            ranger = ranger * -1 if ranger < 0
          rescue Exception
            ranger = 0
          end
        end
      end
    end
    ranger
  end

  def get_start_ranger_device_code device_code
    start = 0
    split_device_code = device_code.split("_")
    if split_device_code.count > 1
      begin
        ranger_split = split_device_code[split_device_code.count - 1].split("-")
        if ranger_split.count > 1
          start = ranger_split[0].to_i
          start = ranger_split[1].to_i if start > ranger_split[1].to_i
        end
      rescue Exception
        start = 0
      end
    end
    start
  end

  def render_new_device_code max_code
    new_code = ""
    total_char_append = Settings.device_code.max_length - max_code.to_s.mb_chars.length
    if total_char_append > 0
      for i in 1..total_char_append
        new_code << Settings.device_code.append_character
      end
    end
    new_code << max_code.to_s
  end

  def init_device_category device_code
    if device_code.present?
      split_device_code = device_code.split("_")
      template_code = split_device_code[0]
      if split_device_code.count > 1
        template_code = ""
        (split_device_code.count - 1).times {|i|
          template_code << "#{split_device_code[i]}_"
        }
      end
    end
    device_category = create_device_category template_code
    device_category
  end

  def create_device_category template_code
    template_code ||= "import_category_template_code_"
    device_category = @list_device_category.detect{|w| w[:template_code] == template_code}
    device_category ||= @list_import_device_category.detect{|w| w[:template_code] == template_code}
    unless device_category.present?
      device_category = DeviceCategory.create name: "import_category_#{template_code}",
        template_code: template_code,
        created_by: @current_user_id,
        updated_by: @current_user_id,
        device_group_id: @device_group.id
        @list_import_device_category << device_category
    end
    device_category
  end

  def init_device_group
    @device_group = DeviceGroup.find_by name: "import_category_group"
    @device_group ||= DeviceGroup.create name: "import_category_group",
      description: "import_category_group",
      created_by: @current_user_id,
      updated_by: @current_user_id
  end

  def init_invoice invoice_number
    unless invoice_number.present?
      invoice = @list_invoice.detect{|w| w[:invoice_number] == invoice_number}
      invoice ||= @list_import_invoice.detect{|w| w[:invoice_number] == invoice_number}
      unless invoice.present?
        invoice =  Invoice.create invoice_number: invoice_number,
          created_by: @current_user_id,
          updated_by: @current_user_id
        @list_import_invoice << invoice
      end
    end
    invoice
  end

  def create_assigment
    user_dms = get_list_user
    if user_dms.present?
      user_dms.each do |user|
        assigment = init_assignment user.id
        imported_devices =  @list_assigment.select {|x| x[:email].eql? user.email}
          .map {|x| x[:device_code] }
        devices = Device.find_by device_code: imported_devices
        list_device.assignment_details.create device: devices
      end
    end
  end

  def get_list_user
    @list_email = @list_assigment.uniq {|e| e[:email]}.map {|x| x[:email]}
    user_dms = User.find_by email: @list_email
  end

  def init_assignment user_id
    assigment = Assignment.find_by assignee_id: user_id, request_id: nil
    assigment ||= Assignment.create assignee_id: user_id,
      description: Settings.import.default_message.assigment_description,
      created_by: @current_user_id,
      updated_by: @current_user_id
  end
end
