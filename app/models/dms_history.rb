class DmsHistory < ApplicationRecord
  attr_accessor :optional_hash

  after_initialize :get_object

  scope :of_object, ->dms_object_id, dms_object_type_id do
    where dms_object_id: dms_object_id, dms_object_type: dms_object_type_id
  end

  def get_object
    self.optional_hash = JSON.parse dms_history_data
  end
end
