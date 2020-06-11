# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Role < ApplicationRecord
  has_many  :users

  def self.doctor
    find_by(name: 'Doctor')
  end

  def self.patient
    find_by(name: 'Patient')
  end
end
