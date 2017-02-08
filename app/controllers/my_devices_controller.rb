class MyDevicesController < ApplicationController
  def index
    @devices = Device.find_assigne_device(current_user.id)
      .paginate page: params[:page]
  end
end
