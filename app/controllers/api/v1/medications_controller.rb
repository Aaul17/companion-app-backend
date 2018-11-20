class Api::V1::MedicationsController < ApplicationController
  before_action :find_medication, only: [:show, :update, :destroy]

  def index
    @medications = Medication.all
    render json: @medications
  end

  def show
    render json: @medication, status:200
  end

  def create
    @medication = Medication.create(medication_params)
    render json: @medication, status: 201
  end

  def update
    @medication.update(medication_params)
    if @medication.save
      render json: @medication, status: :accepted
    else
      render json: { errors: @medication.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    medicationId = @medication.id
    @medication.destroy
    render json: {message:"Zap! medication deleted", medicationId:medicationId}
  end

  private

  def medication_params
    params.require(:medication).permit(:name, :dose, :frequency, :doctor_id, :user_id)
  end

  def find_medication
    @medication = Medication.find(params[:id])
  end
end
