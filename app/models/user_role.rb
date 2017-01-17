class UserRole < ApplicationRecord
  belong_to :user
  belong_to :roles
end
