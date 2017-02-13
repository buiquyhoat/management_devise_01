class DevicesController < ApplicationController
  before_action :init_device, except: [:index, :new, :create]
  before_action :init_dropdown, only: :index
  before_action :init_dropdown_add_new, only: [:new, :edit]
  before_action :logged_in_user
  before_action :check_permision, except: :show

  def index
    get_devices
  end

  def show
    @using_histories = AssignmentDetail.by_device(@device.id)
      .return_date_sort_asc.includes(:device)
    @device_histories = DmsHistory.of_object @device.id, Settings.history_type.device
    @request = Request.find_by id: params[:request_id] if params[:request_id].present?
    respond_to do |format|
      format.js
    end
  end

  def new
    @device = Device.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @device = Device.new device_params
    set_created_by @device
    save_success = @device.save
    respond_to do |format|
      format.html
      format.js
        if save_success
          get_devices
        end
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    set_updated_by @device
    @device.update_attributes device_params
    respond_to do |format|
      format.js
        render "devices/create"
    end
  end

  def destroy
    @device.destroy ? flash[:success] = t("device_manager.delete_action.success") :
      flash[:danger] = t("device_manager.delete_action.fail")
    redirect_to devices_path
  end

  private

  def init_device
    @device = Device.find_by id: params[:id]
    unless @device
      flash[:danger] = t "device_manager.message_device_not_exist"
      redirect_to devices_path
    end
    @support = Supports::User.new current_user
  end

  def init_dropdown
    @device_status = DeviceStatus.all
    @device_categories = DeviceCategory.all
    @device_invoices = Invoice.all
  end

  def init_dropdown_add_new
    @device_categories = DeviceCategory.all
    @device_status = DeviceStatus.not_in_ids Settings.device_status.using
    @device_invoices = Invoice.all
  end

  def device_params
    params.require(:device).permit :device_code, :production_name, :model_number,
      :device_status_id, :device_category_id, :invoice_id, :serial_number, :picture
  end

  def set_created_by device
    device.created_by = current_user.id
    device.updated_by = current_user.id
  end

  def set_updated_by device
    device.updated_by = current_user.id
  end

  def get_devices
    @devices = Device.includes(:device_category)
      .includes(:device_status)
      .includes(:invoice)
      .of_category(params[:category_id])
      .of_status(params[:status_id]).of_invoice(params[:invoice_number])
      .paginate page: params[:page]
  end

  def check_permision
    unless current_user.can_assignment
      redirect_to root_url
    end
  end
end
