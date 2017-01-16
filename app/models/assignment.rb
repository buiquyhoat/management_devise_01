class Assignment < ApplicationRecord
  has_many :assignment_details, dependent: :destroy
  has_many :devises, through: :assignment_details
  belong_to :users
  belong_to :requests
end
