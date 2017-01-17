class User < ApplicationRecord
  has_many :return_devices, dependent: :destroy
  has_many :assignments, dependent: :destroy
  has_many :devises, through: :assignments
  has_many :requests, dependent: :destroy
  has_many :user_roles, dependent: :destroy
  belong_to :departments
  belong_to :managers, through: :departments, source: :manager
end
