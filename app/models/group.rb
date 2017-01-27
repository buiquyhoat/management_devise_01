class Group < ApplicationRecord
  has_many :usergroup, dependent: :destroy
  has_many :permission, dependent: :destroy

  def highest_permission entry, action
    permission.each do |p|
      return true if p.entry == entry && p.optional_hash[action] == true
    end
    false
  end
end
