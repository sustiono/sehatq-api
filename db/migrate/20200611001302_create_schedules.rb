class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
