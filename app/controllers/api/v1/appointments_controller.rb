class Api::V1::AppointmentsController < ApplicationController
  before_action :find_appointment, only: [:show, :update, :destroy]

  def index
    @appointments = Appointment.all
    render json: @appointments
  end

  def show
    render json: @appointment, status:200
  end

  def create
    @appointment = Appointment.create(appointment_params)
    render json: @appointment, status: 201
  end

  def update
    @appointment.update(appointment_params)
    if @appointment.save
      render json: @appointment, status: :accepted
    else
      render json: { errors: @appointment.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    appointmentId = @appointment.id
    @appointment.destroy
    render json: {message:"Zap! appointment deleted", appointmentId:appointmentId}
  end

  private

  def appointment_params
    params.require(:appointment).permit(:name, :details, :scheduled, :user_id)
  end

  def find_appointment
    @appointment = Appointment.find(params[:id])
  end
end
