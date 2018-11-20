class Api::V1::DoctorsController < ApplicationController
  before_action :find_doctor, only: [:show, :update, :destroy]

  def index
    @doctors = Doctor.all
    render json: @doctors
  end

  def show
    render json: @doctor, status:200
  end

  def create
    @doctor = Doctor.create(doctor_params)
    render json: @doctor, status: 201
  end

  def update
    @doctor.update(doctor_params)
    if @doctor.save
      render json: @doctor, status: :accepted
    else
      render json: { errors: @doctor.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    doctorId = @doctor.id
    @doctor.destroy
    render json: {message:"Zap! doctor deleted", doctorId:doctorId}
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :specialty, :phone, :address, :last_seen, :user_id)
  end

  def find_doctor
    @doctor = Doctor.find(params[:id])
  end
end
