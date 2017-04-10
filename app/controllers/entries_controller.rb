class EntriesController < ApplicationController
  def entry_params
      params.require(:entry).permit(:started_at, :ended_at, :content)
  end
  
  def index
      @entries = current_user.entries
  end

  def show
      @entry = Entry.find params[:id]
  end
  
  def create
      puts entry_params
      @entry = Entry.create!(entry_params)
      @entry.user_id = current_user.id
      @entry.save
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
      @entry.update_attributes! entry_params
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
