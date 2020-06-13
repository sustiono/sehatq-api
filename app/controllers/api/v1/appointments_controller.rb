class Api::V1::AppointmentsController < ApplicationController
  def create
    appointment = Appointment.new(appointment_params)
    if appointment.save
      render json: appointment, status: 201
    else
      render json: appointment.errors, status: :unprocessable_entity
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:user_id, :schedule_id)
  end
end
