class DeviceAssignController < ApplicationController
  def show
    @device_can_assign = Device.can_assign.of_category params[:id]
    respond_to do |format|
      format.js do
      	render json: @device_can_assign.map{|device| {id: device.id,
          name: device.production_name}}
      end
    end
  end
end
