class AddPictureToDevices < ActiveRecord::Migration[5.0]
  def change
    add_column :devices, :picture, :string
  end
end
