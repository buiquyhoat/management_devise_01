class DeviceCategory < ApplicationRecord
  has_many :request_details
  has_many :devices, dependent: :destroy
  belongs_to :device_group

  delegate :name, to: :device_group, prefix: true, allow_nil: true

  validates :template_code, uniqueness: {case_sensitive: false}
  validates :name, uniqueness: {case_sensitive: false}

  scope :of_group, ->group_id do
    where device_group_id: group_id if group_id.present?
  end
end
