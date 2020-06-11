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
#  index_appointments_on_schedule_id  (schedule_id)
#  index_appointments_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (schedule_id => schedules.id)
#  fk_rails_...  (user_id => users.id)
#
class Appointment < ApplicationRecord
  validates :schedule_id, :user_id, presence: true

  belongs_to  :patient, class_name: 'User', foreign_key: :user_id
  belongs_to  :doctor_schedule, class_name: 'Schedule', foreign_key: :schedule_id
end