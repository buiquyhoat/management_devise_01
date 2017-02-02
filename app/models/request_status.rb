class RequestStatus < ApplicationRecord
  has_many :requests, dependent: :destroy

  scope :staff_request_status, -> do
    where.not("id = ? OR id = ?", Settings.request_status.approved,
      Settings.request_status.done)
  end
end
