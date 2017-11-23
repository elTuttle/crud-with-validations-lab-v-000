class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(title: params[:song][:title], artist_name: params[:song][:artist_name], released: params[:song][:released], release_year: [:song][:release_year].to_i, genre: params[:song][:genre])
    binding.pry
    if @song.save
      redirect song_path(@song)
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def song_params
    params.permit(:title, :artist_name, :released, :release_year, :genre)
  end

  def set_song!
    @song = Song.find(params[:id])
  end

end
