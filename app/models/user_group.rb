class UserGroup < ApplicationRecord
  belongs_to :user
  belongs_to :group

  delegate :name, to: :group, prefix: true, allow_nil: true

  scope :default_parent_path, ->{where is_default_group: true}

  scope :by_user, ->user_id{where user_id: user_id if user_id.present?}
end
