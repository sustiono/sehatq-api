# == Schema Information
#
# Table name: schedules
#
#  id          :bigint           not null, primary key
#  end_time    :datetime
#  start_time  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  hospital_id :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_schedules_on_hospital_id  (hospital_id)
#  index_schedules_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (hospital_id => hospitals.id)
#  fk_rails_...  (user_id => users.id)
#
class ScheduleSerializer < ActiveModel::Serializer
  has_many    :patients
  belongs_to  :doctor

  attributes :id, :id, :start_time, :end_time
end
