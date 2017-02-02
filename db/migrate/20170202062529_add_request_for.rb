class AddRequestFor < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :for_user_id, :integer
    add_foreign_key :requests, :users, column: :for_user_id
  end
end
