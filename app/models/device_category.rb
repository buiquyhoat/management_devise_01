class DeviceCategory < ApplicationRecord
  belongs_to :device_group
  has_many :request_details
  has_many :devices, dependent: :destroy
end
