class AddUniqueIndexToAppointment < ActiveRecord::Migration[6.0]
  def change
    add_index :appointments, [:user_id, :schedule_id], unique: true
  end
end
