class ApplicationController < ActionController::API
  before_action :authenticate_user!, unless: :unauthenticable_controller?

  def authenticate_user!
    header = request.headers['Authorization']
    token = header.split(' ').last if header
    begin
      decoded = JsonWebToken.decode(token)
      current_user = User.find(decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => error
      render json: error, status: :unauthorized
    rescue JWT::DecodeError => error
      render json: error, status: :unauthorized
    end
  end

  private

  def unauthenticable_controller?
    controller_path == 'api/v1/users'
  end
end
