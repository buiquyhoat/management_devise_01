class ReturnDevice < ApplicationRecord
  has_many :return_device_details, dependent: :destroy
  has_many :devises, through: :return_device_details
  belongs_to :users
end
