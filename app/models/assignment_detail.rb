class AssignmentDetail < ApplicationRecord
  belongs_to :assignments
  belongs_to :devices
end
