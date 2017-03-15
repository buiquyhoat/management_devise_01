class Device < ApplicationRecord
  require "roo"

  belongs_to :device_category
  belongs_to :invoice
  belongs_to :device_status
  has_many :return_device_details, dependent: :destroy
  has_many :assignment_details, dependent: :destroy

  delegate :name, to: :device_status, prefix: true, allow_nil: true
  delegate :name, to: :device_category, prefix: true, allow_nil: true
  delegate :invoice_number, to: :invoice, prefix: true, allow_nil: true

  after_commit :create_history

  mount_uploader :picture, AvatarUploader

  validates :device_code, presence: true, uniqueness: {case_sensitive: false}
  validates :production_name, presence: true 
  validates :serial_number, presence: true
  validates :model_number, presence: true

  scope :find_assigne_device, ->(user_id){where "id in (select d.id from
    devices as d join assignment_details asd on d.id = asd.device_id
    join assignments as a on a.id = asd.assignment_id where a.assignee_id = ?)",
    user_id}
  scope :of_category, ->device_category_id do
    where device_category_id: device_category_id if device_category_id.present?
  end
  scope :of_status, ->device_status_id do
    where device_status_id: device_status_id if device_status_id.present?
  end
  scope :of_invoice, ->invoice_id do
    where invoice_id: invoice_id if invoice_id.present?
  end

  scope :can_assign, -> {where device_status_id: Settings.device_status.available}

  scope :load_devices_with_empty_code, -> {
    where printed_code: nil
  }

  private

  def create_history
    action_id = 0
    if created_at === updated_at
      action_id = created_by
      action = Settings.action.created
    else
      action_id = updated_by
      action = Settings.action.updated
    end

    user_name = get_created_name action_id
    content = I18n.t("history.device",action: action, name: user_name)
    history_data = {"content": content, "status": device_status_name}
    create_hitory id, history_data.to_json, Settings.history_type.device
  end
end
