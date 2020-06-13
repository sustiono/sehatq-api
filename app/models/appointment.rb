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

  before_validation :availbility_doctor_schedule, :time_validation

  belongs_to  :patient, class_name: 'User', foreign_key: :user_id
  belongs_to  :doctor_schedule, class_name: 'Schedule', foreign_key: :schedule_id

  private

  def availbility_doctor_schedule
    if doctor_schedule.nil? || doctor_schedule.user_id != self.user_id
      self.errors.add(:schedule, 'The schedule is not found')
    elsif User.find_by(id: self.user_id).nil?
      self.errors.add(:schedule, 'The Doctor is not found')
    end
  end

  def time_validation
    if doctor_schedule.present? && (DateTime.current < doctor_schedule.start_time  || DateTime.current > doctor_schedule.end_time)
      self.errors.add(
        :time, 'Make an appointment within 30 minutes before the schedule starts'
      )
    end
  end
end
