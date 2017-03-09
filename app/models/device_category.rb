class DeviceCategory < ApplicationRecord
  attr_accessor :device_total, :device_using, :device_avalible, :device_assignment, :using_percent

  has_many :request_details
  has_many :devices, dependent: :destroy
  belongs_to :device_group

  delegate :name, to: :device_group, prefix: true, allow_nil: true

  validates :template_code, presence: true, uniqueness: {case_sensitive: false}
  validates :name, presence: true, uniqueness: {case_sensitive: false}

  scope :of_group, ->group_id do
    where device_group_id: group_id if group_id.present?
  end

  paginates_per Settings.device_categories_per_page

  def extend_dashboard_data
    self.device_total = devices.count
    self.device_using = devices.of_status(Settings.device_status.using).count
    self.device_avalible = devices.of_status(Settings.device_status.available).count
    self.device_assignment = 0
    request_details.of_request_status(Settings.request_status.waiting_done)
      .each do |request_detail|
        self.device_assignment += request_detail.number if request_detail.number.present?
      end
    self.using_percent = self.device_total == 0 ? 0 : self.device_using * 100 / self.device_total
  end
end
