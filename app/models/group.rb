class Group < ApplicationRecord
  has_many :usergroup, dependent: :destroy
  has_many :permission, dependent: :destroy

  scope :closest_child_groups, ->group_id do
    where closest_parent_id: group_id if group_id.present?
  end
  scope :child_groups, ->path do
    select("id").where("parent_path LIKE ?", convert_like(path))
  end

  class << self
    def convert_like param
      "#{param}%"
    end
  end

  def highest_permission entry, action
    permission.each do |p|
      return true if p.entry == entry && p.optional_hash[action] == true
    end
    false
  end
end
