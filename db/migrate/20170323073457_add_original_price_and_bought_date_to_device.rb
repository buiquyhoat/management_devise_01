class AddOriginalPriceAndBoughtDateToDevice < ActiveRecord::Migration[5.0]
  def change
    add_column :devices, :original_price, :float, default: 0.0
    add_column :devices, :bought_date, :date, default: "2017-01-01"
    add_column :devices, :printed_code, :string
  end
end
