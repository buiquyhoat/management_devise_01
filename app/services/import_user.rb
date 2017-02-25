class ImportUser
  attr_reader :params

  def initialize
  end

  def import_user file
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(Settings.import.first_row)
    clear_excel_data
    (Settings.import.start_row..spreadsheet.last_row).each do |i|
      company_admin_group = Group.find_by name: Settings.import.admin_group
      if spreadsheet.row(i)[Settings.import.user.column.div_group_name].present?
        div_group = Group.find_by name: spreadsheet.row(i)[Settings.import.user.column.div_group_name]
        if div_group.nil? && company_admin_group.present?
          div_group = create_group_from_excel spreadsheet.row(i)[Settings.import.user.column.div_group_name],
            company_admin_group.id, company_admin_group.parent_path,
            company_admin_group.company_id
        end
        if spreadsheet.row(i)[Settings.import.user.column.sec_group_name].present?
          sec_group = Group.find_by name: spreadsheet.row(i)[Settings.import.user.column.sec_group_name],
            closest_parent_id: div_group.id
          if sec_group.nil?
            sec_group = create_group_from_excel spreadsheet.row(i)[Settings.import.user.column.sec_group_name],
              div_group.id, div_group.parent_path, div_group.company_id
          end
          if spreadsheet.row(i)[Settings.import.user.column.lead_group_name].present?
            lead_group = Group.find_by name: spreadsheet.row(i)[Settings.import.user.column.lead_group_name],
              closest_parent_id: sec_group.id
            if lead_group.nil?
              lead_group = create_group_from_excel spreadsheet.row(i)[Settings.import.user.column.lead_group_name],
                sec_group.id, sec_group.parent_path, sec_group.company_id
            end
          end
        end
      end

      if spreadsheet.row(i)[Settings.import.user.column.user_name].present? &&
        spreadsheet.row(i)[Settings.import.user.column.user_office_email].present?
        new_user = User.find_by email: spreadsheet.row(i)[Settings.import.user.column.user_office_email]
        if new_user.nil?
          new_user = create_user_from_excel spreadsheet.row(i)[Settings.import.user.column.user_name],
            spreadsheet.row(i)[Settings.import.user.column.user_office_email]
          if new_user.id.present?
            create_user_setting new_user.id
            group_id = div_group.id if div_group.present?
            group_id = sec_group.id if sec_group.present?
            group_id = lead_group.id if lead_group.present?
            if spreadsheet.row(i)[Settings.import.user.column.position].present? &&
              (spreadsheet.row(i)[Settings.import.user.column.position] == Settings.position.division_manager ||
              spreadsheet.row(i)[Settings.import.user.column.position] == Settings.position.section_manager)
              group_id = div_group.id if div_group.present?
            end
            create_user_group new_user.id, group_id
          end
        end
      end
    end
  end

  def create_high_permission group_name, group_id, closest_parent_id
    if closest_parent_id == 1
      case group_name
      when Settings.special_group_name.back_office_manage
        create_permission_for_group_excel group_id, Settings.entry.request, Settings.action.waiting_done
        create_permission_for_group_excel group_id, Settings.entry.device, Settings.action.create
      else
        create_permission_for_group_excel group_id, Settings.entry.request, Settings.action.approve
      end
    else
      if group_name == Settings.special_group_name.general_affairs
        create_permission_for_group_excel group_id, Settings.entry.request, Settings.action.done
        create_permission_for_group_excel group_id, Settings.entry.device, Settings.action.create
      end
    end
  end

  def create_user_setting user_id
    UserSetting.create(
      user_id: user_id,
      from_excel: true,
      user_settings_data: Settings.user_setting_default)
  end

  def create_user_from_excel name, email
    User.create(
      last_name: name,
      first_name: "",
      email: email,
      password: Settings.default_password,
      password_confirmation: Settings.default_password,
      from_excel: true)
  end

  def create_user_group user_id, group_id
    if user_id.present? && group_id.present?
      UserGroup.create(
        user_id: user_id,
        group_id: group_id,
        is_default_group: true,
        from_excel: true)
    end
  end

  def create_group_from_excel group_name, closest_parent_id, parent_path, company_id
    parent_path = "" if parent_path.nil?
    parent_path += "/#{closest_parent_id}"
    new_group = Group.create(
      name: group_name,
      closest_parent_id: closest_parent_id,
      parent_path: parent_path,
      group_type: 1,
      company_id: company_id,
      from_excel: 1)
    create_permission_for_group_excel new_group.id, Settings.entry.request, Settings.action.create
    create_high_permission group_name, new_group.id, new_group.closest_parent_id
    new_group
  end

  def create_permission_for_group_excel group_id, entry, action
    case entry
    when Settings.entry.request
      optional = permission_optional action
    when Settings.entry.device
      optional = permission_optional action
    end
    permission = Permission.create(
      entry: entry,
      group_id: group_id,
      optional: optional,
      from_excel: true)
  end

  def permission_optional action
    case action
    when Settings.action.create
      Settings.optional.crud
    when Settings.action.approve
      Settings.optional.approve
    when Settings.action.waiting_done
      Settings.optional.waiting_done
    when Settings.action.done
      Settings.optional.done
    end
  end

  def clear_excel_data
    Permission.delete_all from_excel: true
    UserGroup.delete_all from_excel: true
    Group.delete_all from_excel: true
    UserSetting.delete_all from_excel: true
    Request.from_excel.destroy_all
    User.delete_all from_excel: true
  end

  def open_spreadsheet file
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path)
      when ".xls" then Roo::Excel.new(file.path)
      when ".xlsx" then Roo::Excelx.new(file.path)
      else raise t "import.unknow_file_type", filename: file.original_filename
    end
  end
end
