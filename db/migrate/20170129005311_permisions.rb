class Permisions < ActiveRecord::Migration[5.0]
  def change
    create_table :permissions do |t|
      t.string :entry
      t.string :optional
    end
    add_reference :permissions, :group, foreign_key: true
  end
end
