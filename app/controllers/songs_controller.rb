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
    @song = Song.new(title: params[:song][:title], artist_name: params[:song][:artist_name], released: params[:song][:released], genre: params[:song][:genre])
    @song.release_year = params[:song][:release_year].to_i
    #binding.pry
    if @song.valid?
      #binding.pry
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @song = set_song!
    @song.title = params[:song][:title]
    @song.artist_name = params[:song][:artist_name]
    @song.released = params[:song][:released]
    @song.genre = params[:song][:genre]
    @song.release_year = params[:song][:release_year].to_i
    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      render :edit
    end
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
