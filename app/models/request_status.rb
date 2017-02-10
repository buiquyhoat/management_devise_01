class RequestStatus < ApplicationRecord
  has_many :requests, dependent: :destroy

  scope :waiting_approve, ->{where.not id: Settings.request_status.done}
  scope :request_status_waiting_done, ->do
    where.not id: Settings.request_status.waiting_approve,
      id: Settings.request_status.done
  end
  scope :request_status_approve, ->{where.not id: Settings.request_status.done,
    id: Settings.request_status.waiting_done}
end
