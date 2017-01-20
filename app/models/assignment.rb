class Assignment < ApplicationRecord
  belongs_to :users
  belongs_to :requests
  has_many :assignment_details, dependent: :destroy
  has_many :devises, through: :assignment_details
end
