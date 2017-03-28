class AddIsBarcodeToDevice < ActiveRecord::Migration[5.0]
  def change
    add_column :devices, :is_barcode, :boolean, default: true
  end
end
