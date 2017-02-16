class DeviceStatus < ApplicationRecord
  attr_accessor :device_count

  has_many :devices, dependent: :destroy

  after_initialize :create_extend_data

  scope :not_in_ids, ->ids{where.not id: ids}

  class << self

    def calculate_device_dashboard
      total_device = Device.all.count
      device_chartobj = init_device_chart
      if total_device != 0
        DeviceStatus.all.each do |status|
          device_items = status.device_count
          device_chartobj[:data] << device_items
          device_chartobj[:datapercent] << get_percent(device_items, total_device)
          device_chartobj[:device_status] << status.id
          device_chartobj[:labels] << status.name
        end
      end
      device_chartobj[:backgroundColor] = Settings.dashboard.device.backgroundColor
      device_chartobj[:hoverBackgroundColor] = Settings.dashboard.device.hoverBackgroundColor
      device_chartobj[:colors] = Settings.dashboard.device.colors
      device_chartobj[:have_data] = device_chartobj[:datapercent].count != 0
      device_chartobj
    end

    def init_device_chart
      {type: Settings.dashboard.device.type, labels: [], data: [],
        datapercent:[], backgroundColor: [], hoverBackgroundColor: [], colors: [],
        have_data: false, device_status: []}
    end

    def get_percent part, total
      part * 100 / total
    end
  end

  private

  def create_extend_data
    self.device_count = devices.count
  end
end
