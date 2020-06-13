class Api::V1::DoctorsController < ApplicationController
  def index
    include = params[:include_schedule] == 'true' ? [schedules: :patients] : []
    doctors = User.doctors.includes([schedules: [:appointments, :patients]]).order(:id)
    doctors_serialize = ActiveModelSerializers::SerializableResource.new(
      doctors, include: include
    )
    render json: doctors_serialize.to_json
  end
end
