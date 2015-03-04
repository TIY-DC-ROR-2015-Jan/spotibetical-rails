class VotesController < ApplicationController
  def create
    song = Song.find params[:song_id]
    if current_user.vote_for song
      flash[:notice] = "Your vote has been recorded"
    else
      flash[:error] = "You are out of votes. Please wait 'til next week."
    end
    redirect_to :back
  end
end