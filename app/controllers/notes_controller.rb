class NotesController < ApplicationController
  prepend_before_filter :authenticate_with_basic
  before_filter :load_note, only: %w(edit update destroy)

  def index
    @notes = current_user.notes.order("created_at DESC")

    respond_to do |format|
      format.html
      format.json { render json: @notes }
    end
  end

  def new
    @note = Note.new
  end

  def edit ; end

  def create
    @note = current_user.notes.build(params[:note])

    respond_to do |format|
      if @note.save
        format.html { redirect_to notes_path, notice: 'Note was successfully created.' }
        format.json { render json: @note, status: :created, location: @note }
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to notes_path, notice: 'Note was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully deleted.' }
      format.json { head :ok }
    end
  end

  private

  def load_note
    @note = current_user.notes.find(params[:id])
  end
end
