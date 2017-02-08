class CreateDmsHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :dms_histories do |t|
      t.integer :dms_object_id
      t.string :dms_history_data
      t.integer :dms_object_type

      t.timestamps
    end
  end
end
