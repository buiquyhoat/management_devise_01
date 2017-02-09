class UserSetting < ApplicationRecord
  attr_accessor :optional_hash

  after_initialize :get_object

  def get_object
    self.optional_hash = JSON.parse user_settings_data
  end

  def set_option
    self.user_settings_data = self.optional_hash.to_json
  end
end
