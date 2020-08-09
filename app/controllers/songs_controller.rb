class SongsController < ApplicationController
  before_action :set_song, only: [:new, :create]

  def new
    set_artist_and_genre
  end

  def create
    @song.genre = Genre.find_by_id(params[:song][:genre].to_i)
    @song.artist = Artist.find_by_id(params[:song][:artist].to_i)
    @song.bass = @bass
    if @song.save
      redirect_to bass_path(@bass)
    else
      set_song
      set_artist_and_genre
      render :new
    end
  end

  private

  def set_song
    @bass = Bass.find(params[:bass_id])
    @song = params.key?(:song) ? Song.new(song_params) : Song.new
  end

  def set_artist_and_genre
    @genres = Genre.order(:name)
    @artists = Artist.order(:name)
  end

  def song_params
    params.require(:song).permit(:title, :year, :album, :youtube_url)
  end
end
