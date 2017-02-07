class AssignmentDetail < ApplicationRecord
  attr_accessor :device_category_id, :device_category_group_id

  belongs_to :assignment, inverse_of: :assignment_details
  belongs_to :device

  delegate :assignee_name, to: :assignment, prefix: true

  scope :by_device, ->device_id do
    where device_id: device_id if device_id.present?
  end
end
