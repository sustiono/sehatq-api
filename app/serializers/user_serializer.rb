# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  address         :string
#  email           :string           not null
#  name            :string
#  password_digest :string
#  token           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  role_id         :bigint           not null
#
# Indexes
#
#  index_users_on_role_id  (role_id)
#
# Foreign Keys
#
#  fk_rails_...  (role_id => roles.id)
#
class UserSerializer < ActiveModel::Serializer
  has_many    :schedules
  belongs_to  :role

  attributes :id, :name, :address, :email
end
