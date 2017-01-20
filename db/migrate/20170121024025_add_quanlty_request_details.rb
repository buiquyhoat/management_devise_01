class AddQuanltyRequestDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :request_details, :number, :integer
  end
end
