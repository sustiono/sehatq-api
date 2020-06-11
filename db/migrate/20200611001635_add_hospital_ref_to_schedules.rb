class AddHospitalRefToSchedules < ActiveRecord::Migration[6.0]
  def change
    add_reference :schedules, :hospital, null: false, foreign_key: true
  end
end
