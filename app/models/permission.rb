class Permission < ApplicationRecord
  attr_accessor :optional_hash

  belongs_to :group

  before_save :set_option
  after_initialize :create_another

  def create_another
    self.optional_hash = JSON.parse optional if optional.present?
  end

  def set_option
    optional = self.optional_hash.to_json
  end

end
