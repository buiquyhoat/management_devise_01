class RequestDetail < ApplicationRecord
  belongs_to :request, inverse_of: :request_details
  belongs_to :device_category

  scope :of_request_status, ->request_status_id do
    where "id in (select rd.id from request_details as rd join requests as r on r.id = rd.request_id
      where r.request_status_id = ?)",request_status_id
  end
end
