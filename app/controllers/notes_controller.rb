class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy, :inactive, :restore, :download]
  before_action :authenticate_user!, except: [:home]
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  

  def home
  end

  def index
    @notes = Note.user_notes(current_user).active
  end

  
  def show
  end

  def new
    @note = Note.new
  end

  def edit
  end

  
  def create
    @note = Note.new(note_params)
    @note.get_tags
    @note.user_id = current_user.id 
    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    params = note_params
    tags   = note_params.dig("etags")
    params["etags"] = NotesHelper::Utilities.str_to_ary(tags)
    respond_to do |format|
      if @note.update(params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def inactive
    @note.inactive!
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully moved to trash.' }
      format.json { head :no_content }
    end
  end

  def trash
    @notes = Note.user_notes(current_user).inactive
  end

  def restore
    @note.active!
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully Restored.' }
      format.json { head :no_content }
    end
  end

  def download
    result = UseCase::V1::DownloadFile.new(note: @note).call
    send_file result, :disposition => 'attachment'
  end

  private

    def set_note
      @note = Note.find(params[:id])
    end

    def record_not_found
      redirect_to root_path, notice: "Inaccesible Entity"
    end

    def note_params
      params.require(:note).permit(:title, :etags, :content, :status, :user_id)
    end

end
