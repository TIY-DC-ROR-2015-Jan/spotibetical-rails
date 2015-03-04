class SongsController < ApplicationController
  def index
    # FIXME: add sorting options
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    #create_params = params.require(:song).permit(:spotify_id)
    @song = current_user.add_song params[:song][:spotify_id]
    if @song.save
      redirect_to songs_path, notice: "Song created!"
    else
      render :new
    end
  end
end