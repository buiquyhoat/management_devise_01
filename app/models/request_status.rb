class RequestStatus < ApplicationRecord
  has_many :requests, dependent: :destroy

  scope :request_status_staff_waiting_approve, ->do
    where id: [Settings.request_status.waiting_approve,
      Settings.request_status.cancelled]
  end

  scope :request_status_manager_cancelled, ->do
    where id: [Settings.request_status.cancelled,
      Settings.request_status.approved]
  end

  scope :request_status_manager_waiting_approve, ->do
    where.not id: [Settings.request_status.waiting_done,
      Settings.request_status.done]
  end

  scope :request_status_bomanager_cancelled, ->do
    where.not id: [Settings.request_status.waiting_approve,
      Settings.request_status.done, Settings.request_status.approved]
  end

  scope :request_status_bomanager_waiting_done, ->do
    where id: [Settings.request_status.cancelled,
      Settings.request_status.waiting_done, Settings.request_status.approved]
  end
end
