class UserGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :user_groups do |t|
      t.boolean :is_default_group
    end
    add_reference :user_groups, :user, foreign_key: true
  end
end
