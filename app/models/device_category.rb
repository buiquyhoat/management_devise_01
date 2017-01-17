class DeviceCategory < ApplicationRecord
  has_many :request_details
  has_many :devices, dependent: :destroy
  belongs_to :device_group
end
