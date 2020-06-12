class Api::V1::DoctorsController < ApplicationController
  def index
    doctors = User.doctors.order(:id)
    doctors_serialize = ActiveModelSerializers::SerializableResource.new(
      doctors, include: [schedules: :patients]
    )
    render json: doctors_serialize.to_json
  end
end
