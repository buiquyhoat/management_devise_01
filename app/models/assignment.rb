class Assignment < ApplicationRecord
  belongs_to :assignee, class_name: User.name
  belongs_to :request
  has_many :assignment_details, inverse_of: :assignment

  delegate :name, :id, to: :assignee, prefix: true

  accepts_nested_attributes_for :assignment_details

  after_create :update_request, :update_device, :create_notification

  validates :assignment_details, presence: true

  scope :default_sort, ->{order created_at: :desc}

  scope :of_assignee, ->assignee_id do
    where assignee_id: assignee_id if assignee_id.present?
  end

  scope :of_created_by, ->created_by do
    where created_by: created_by if created_by.present?
  end

  def check_duplicate?
    assignment_details.each do |detail|
      devices = assignment_details.select{|device| device.device_id == detail.device_id}
      if devices.present? && devices.count > 1
        errors[:base] << I18n.t("assignment.message.assignment_detail_duplicate")
        return true
      end
    end
    false
  end

  def update_request
    if request
      request.request_status_id = Settings.request_status.done
      request.save
    end
  end

  def update_device
    assignment_details.each do |detail|
      detail.device.device_status_id = Settings.device_status.using
      unless detail.device.save
        flash[:danger] = I18n.t("action_message.update_fail")
        break
      end
    end
  end

  def create_notification
    message = ""
    if assignment_details.count == 1
      message = I18n.t("notification.message.single_device_assigned",
        device: assignment_details.first.device.device_code )
    else
      message = I18n.t("notification.message.multil_device_assigned",
        total_device: assignment_details.count)
    end
    create_notify created_by, assignee_id,
      message, Rails.application.routes.url_helpers.devices_path
  end
end
