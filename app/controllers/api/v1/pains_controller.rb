class Api::V1::PainsController < ApplicationController
  before_action :find_pain, only: [:show, :update, :destroy]

  def index
    @pains = Pain.all
    render json: @pains
  end

  def show
    render json: @pain, status:200
  end

  def create
    @pain = Pain.create(pain_params)
    render json: @pain, status: 201
  end

  def update
    @pain.update(pain_params)
    if @pain.save
      render json: @pain, status: :accepted
    else
      render json: { errors: @pain.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    painId = @pain.id
    @pain.destroy
    render json: {message:"Zap! pain deleted", painId:painId}
  end

  private

  def pain_params
    params.require(:pain).permit(:date, :level, :user_id)
  end

  def find_pain
    @pain = Pain.find(params[:id])
  end
end
