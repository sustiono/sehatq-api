class JsonWebToken
  SECRET_KEY = Rails.application.config.secret_key_base

  def self.encode(payload)
    token = JWT.encode(payload, SECRET_KEY)
    User.find(payload[:user_id]).update(token: token)
    token
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end
end
