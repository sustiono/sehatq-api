class Api::V1::HospitalsController < ApplicationController
  def index
    render json: Hospital.all
  end
end
