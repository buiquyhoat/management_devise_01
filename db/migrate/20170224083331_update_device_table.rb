class UpdateDeviceTable < ActiveRecord::Migration[5.0]
  def change
    change_column :devices, :model_number, :string, null: true
    change_column :devices, :production_name, :string, null: true
    change_column :devices, :serial_number, :string, null: true
    change_column :devices, :invoice_id, :integer, null: true
    add_column :devices, :description, :string, limit: 4000
  end
end
