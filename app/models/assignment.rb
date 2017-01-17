class Assignment < ApplicationRecord
  has_many :assignment_details, dependent: :destroy
  has_many :devises, through: :assignment_details
  belongs_to :users
  belongs_to :requests
end
