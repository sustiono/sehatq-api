# == Schema Information
#
# Table name: appointments
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  schedule_id :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_appointments_on_schedule_id              (schedule_id)
#  index_appointments_on_user_id                  (user_id)
#  index_appointments_on_user_id_and_schedule_id  (user_id,schedule_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (schedule_id => schedules.id)
#  fk_rails_...  (user_id => users.id)
#
class Appointment < ApplicationRecord
  validates :schedule_id, :user_id, presence: true
  validates :schedule_id, uniqueness: {
    scope: :user_id, message: 'Can only make 1 appointment in 1 schedule'
  }

  before_validation :time_validation, :availbility_schedule_validation

  belongs_to  :patient, class_name: 'User', foreign_key: :user_id
  belongs_to  :doctor_schedule, class_name: 'Schedule', foreign_key: :schedule_id

  private

  def time_validation
    if DateTime.current < doctor_schedule.start_time  || DateTime.current > doctor_schedule.end_time
      self.errors.add(
        :time, 'Make an appointment within 30 minutes before the schedule starts'
      )
    end
  end

  def availbility_schedule_validation
    if doctor_schedule.appointments.size >= 10
      self.errors.add(:schedule, 'The schedule is full')
    end
  end
end
