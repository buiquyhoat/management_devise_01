class Department < ApplicationRecord
  has_many :users, dependent: :destroy
  belongs_to :manager, class_name: User.name
end
