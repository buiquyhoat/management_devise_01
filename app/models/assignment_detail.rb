class AssignmentDetail < ApplicationRecord
  attr_accessor :device_category_id, :device_category_group_id

  belongs_to :assignment, inverse_of: :assignment_details
  belongs_to :device

  delegate :assignee_name, :assignee_id, to: :assignment, prefix: true
  delegate :device_code, :production_name, :device_category_name, to: :device, prefix: true

  scope :by_device, ->device_id do
    where device_id: device_id if device_id.present?
  end

  scope :by_device_using,-> assignee_id do
    if assignee_id.present?
      joins("join assignments on assignment_details.assignment_id = assignments.id
        and assignments.assignee_id = #{assignee_id}")
      .where return_date: nil
    end
  end
end
