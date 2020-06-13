class SchedulesController < ApplicationController
  def index
    render json: User.doctors
  end
end
