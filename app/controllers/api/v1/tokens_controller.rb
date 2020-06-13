class Api::V1::TokensController < ApplicationController
  def create
    user = User.find_by_email(params[:user][:email])
    if user.nil?
      render json: { user: ['User not found'] }
    else
      if user.authenticate(params[:user][:password])
        render json: user.as_json
      else
        render json: { user: ['Worng password'] }
      end
    end
  end
end
