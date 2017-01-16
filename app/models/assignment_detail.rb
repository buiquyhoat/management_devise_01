class AssignmentDetail < ApplicationRecord
  belong_to :assignments
  belong_to :devices
end
