class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.integer :assignee_id, null: false
      t.column  :title, "Varchar(500)"
      t.column  :description, "Varchar(4000)"
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end
end
