class ImportController < ApplicationController
  before_action :logged_in_user
  def index; end

  def new; end

  def create
    begin
      case params[:type]
      when Settings.import.type.user
        import_user = ImportUser.new
        import_user.import params[:file]
        flash[:success] = t "action_message.import_success"
      when Settings.import.type.device
        import_device_service = ImportDevice.new params, current_user.id
        import_device_service.import_device
        flash[:success] = t "action_message.import_success"
      else
        flash[:danger] = t "action_message.file_type_not_support"
      end
    rescue Exception
      flash[:danger] = t "action_message.import_fail"
    end
    redirect_to import_index_path
  end
end
