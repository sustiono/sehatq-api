# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
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
class User < ApplicationRecord
  require 'json_web_token'

  has_secure_password

  validates :email, uniqueness: true
  validates_format_of :email, with: /@/
  validates :password_digest, :role_id, presence: true

  belongs_to  :role

  after_create  :create_token

  private

  def create_token
    self.update_column(:token, JsonWebToken.encode(user_id: self.id))
  end
end
