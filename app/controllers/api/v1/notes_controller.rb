class Api::V1::NotesController < ApplicationController
  before_action :find_note, only: [:show, :update, :destroy]

  def index
    @notes = Note.all
    render json: @notes
  end

  def show
    render json: @note, status:200
  end

  def create
    @note = Note.create(note_params)
    render json: @note, status: 201
  end

  def update
    @note.update(note_params)
    if @note.save
      render json: @note, status: :accepted
    else
      render json: { errors: @note.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    noteId = @note.id
    @note.destroy
    render json: {message:"Zap! note deleted", noteId:noteId}
  end

  private

  def note_params
    params.require(:note).permit(:title, :body, :user_id)
  end

  def find_note
    @note = Note.find(params[:id])
  end
end
