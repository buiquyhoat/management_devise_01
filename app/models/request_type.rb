class RequestType < ApplicationRecord
  has_many :requests, dependent: :destroy

  enum type: {request: 1, return: 2, borrow: 3}
end
