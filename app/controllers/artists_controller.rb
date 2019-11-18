class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def create
    @artist = Artist.new(artists_params)
 
    if @artist.save
      redirect_to artists_path
    else
      render :new
    end
  end

  def update
    @artist = Artist.find(params[:id])
  
    if @artist.update(artists_params)
      redirect_to artists_path
    else
      render :edit
    end
  end

  def destroy
    Artist.find(params[:id]).destroy
    redirect_to artists_path
  end

  private
  def artists_params
    params.require(:artist).permit(:name)
  end

end
