class CreateUserSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :user_settings do |t|
      t.string :user_settings_data
      t.timestamps
    end

    add_reference :user_settings, :user, foreign_key: true, null: false
  end
end
