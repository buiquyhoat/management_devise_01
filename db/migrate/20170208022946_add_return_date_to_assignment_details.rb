class AddReturnDateToAssignmentDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :assignment_details, :return_date, :datetime, default: nil
  end
end
