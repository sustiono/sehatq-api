class Api::V1::DoctorsController < ApplicationController
  def index
    render json: User.doctors
  end
end
