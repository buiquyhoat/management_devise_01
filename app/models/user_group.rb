class UserGroup < ApplicationRecord
  belongs_to :user
  belongs_to :group
  
  scope :default_parent_path, ->{where is_default_group: true} 
end
