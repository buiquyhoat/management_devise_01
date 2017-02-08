class RequestStatus < ApplicationRecord
  has_many :requests, dependent: :destroy

  scope :waiting_approve, ->{where.not id: Settings.request_status.done}
  scope :request_status_assigment, ->do
    where.not id: Settings.request_status.waiting_approve
  end
  scope :request_status_approve, ->{where.not id: Settings.request_status.done}
end
