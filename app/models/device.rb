class Device < ApplicationRecord
  belongs_to :device_category
  belongs_to :invoice
  belongs_to :device_status
  has_many :return_device_details, dependent: :destroy
  has_many :assignment_details, dependent: :destroy

  delegate :name, to: :device_status, prefix: true
  delegate :name, to: :device_category, prefix: true
  delegate :invoice_number, to: :invoice, prefix: true


  mount_uploader :picture, AvatarUploader

  validates :device_code, :production_name, :model_number, :serial_number, presence: true
  validates :device_code, uniqueness: {case_sensitive: false}

  default_scope ->{order created_at: :desc}
  scope :find_assigne_device, ->(user_id){where "id in (select d.id from
    devices as d join assignment_details asd on d.id = asd.device_id
    join assignments as a on a.id = asd.device_id where a.assignee_id = ?)",
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
end
