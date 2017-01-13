class CreateDeviceCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :device_categories do |t|
      t.column :name, "Varchar(100)", null: false
      t.column :template_code, "Varchar(100)"
    end
  end
end
