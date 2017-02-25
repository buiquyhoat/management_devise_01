class AddExcelColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :from_excel, :boolean
    add_column :groups, :from_excel, :boolean
    add_column :permissions, :from_excel, :boolean
    add_column :user_groups, :from_excel, :boolean
    add_column :user_settings, :from_excel, :boolean
  end
end
