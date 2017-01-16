class Device < ApplicationRecord
  has_many :return_device_details, dependent: :destroy
  has_many :assignment_details, dependent: :destroy
  belongs_to :device_categories
  belongs_to :invoices
  belongs_to :device_statuses
end
