class PrintedCodesController < ApplicationController
  def update
    if Device.load_devices_with_empty_code.size > 0
      Device.load_devices_with_empty_code.find_each(batch_size: Settings.batch_size) do |device|
        printed_code = device.device_code + "|" +
          device.bought_date.to_s.split("-").join("") + "|" +
          device.original_price.to_i.to_s
        device.update_attributes! printed_code: printed_code
      end
      flash[:success] = t "action_message.update_success"
    else
      flash[:danger] = t "action_message.nothing_to_update"
    end
    redirect_to devices_url
  end
end
