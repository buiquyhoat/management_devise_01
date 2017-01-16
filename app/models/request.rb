class Request < ApplicationRecord
  has_many :request_details, dependent: :destroy
  has_many :devises, through: :request_details
  belongs_to :request_types
  belongs_to :request_status
  belongs_to :assignments
  belongs_to :users
end
