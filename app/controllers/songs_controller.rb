class SongsController < ApplicationController
  before_action :set_artist
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  def index
    @songs = @artist.songs
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = @artist.songs.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create
    @song = Song.new(songs_params)
 
    if @song.save
      redirect_to artist_songs_path
    else
      render :new
    end
  end

  private
  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def set_song
    @song = Song.find(params[:id])
  end


  def songs_params
    params.require(:song).permit(:title, :genre)
  end
end
