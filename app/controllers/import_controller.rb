class ImportController < ApplicationController
  before_action :logged_in_user
  def index

  end

  def new

  end

  def create
    begin
      if params[:file].present?
        if params[:type].present? &&  params[:type] == Settings.import_type.device
          import_device_service = ImportDevice.new params, current_user.id
          import_device_service.import_device
        end
        flash[:success] = t "action_message.import_success"
      else
        flash[:danger] = t "import.file_not_found"
      end
    rescue Exception
      flash[:danger] = t "import.import_fail"
    end
    redirect_to new_import_url
  end
end
