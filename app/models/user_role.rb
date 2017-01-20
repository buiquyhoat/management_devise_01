class UserRole < ApplicationRecord
  belongs_to :user
  belongs_to :role
  enum role_id: {admin: 1, manager: 2, staff: 3}
end
