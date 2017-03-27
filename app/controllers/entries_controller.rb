class EntriesController < ApplicationController
  def entry_params
      params.require(:entry).permit(:started_at, :ended_at, :content)
  end
  
  def index
      @entries = Entry.all#current_user.entries
  end

  def show
      @entry = Entry.find params[:id]
  end
  
  def create
      @entry = Entry.create!(entry_params)
      flash[:notice] = "Entry created"
      redirect_to entries_path
  end

  def new
      
  end

  def edit
      @entry = Entry.find params[:id]
  end

  def update
      @entry = Entry.find params[:id]
      @entry.update_attributes! movie_params
      flash[:notice] = "Entry updated"
      redirect_to entry_path(@entry)
  end

  def destroy
      @entry = Entry.find params[:id]
      @entry.destroy
      flash[:notice] = "Entry deleted"
      redirect_to entries_path
  end
end
