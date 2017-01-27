class Groups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :company_id
      t.column :description, "Varchar(4000)"
      t.integer :closest_parent_id
      t.string :parent_path
      t.integer :group_type
      t.string :image
    end
    add_reference :user_groups, :group, foreign_key: true
  end
end
