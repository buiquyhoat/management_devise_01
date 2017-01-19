class Supports::Device
  attr_reader :device

  def initialize device
    @device = device
    created_by
  end

  def created_by
    @created_by ||= User.find_by id: @device.created_by
  end

  def created_by_name
    @created_by_name ||= @created_by.name if @created_by.present?
  end

  def device_status
     @device_status ||= @device.device_status_id
  end
end
