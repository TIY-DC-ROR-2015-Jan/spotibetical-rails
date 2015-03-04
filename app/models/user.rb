class User < ActiveRecord::Base
  class NotAuthorizedError < StandardError; end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :votes
  has_many :songs
  
  def veto! song
    # song.update vetoed: true
    song.vetoed = true
    song.save!
  end

  def add_song spotify_id
    # should fetch from spotify
    songs.new spotify_id: spotify_id, artist: SecureRandom.hex(12), title: SecureRandom.hex(12)
  end

  def vote_for song
    if votes_left > 0
      votes.create! song: song
      update votes_left: votes_left - 1
    end
  end
end
