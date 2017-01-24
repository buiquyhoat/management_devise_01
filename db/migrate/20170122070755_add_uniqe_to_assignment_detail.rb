class AddUniqeToAssignmentDetail < ActiveRecord::Migration[5.0]
  def change
  	add_reference :assignment_details, :assignment, foreign_key: true
    add_index :assignment_details, [:device_id, :assignment_id], unique: true
  end
end
