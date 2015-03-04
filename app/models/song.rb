class Song < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title, :artist

  def self.unvetoed
    where vetoed: false
  end

  def sort_letter
    letter = if artist.downcase.start_with? "a "
      artist[2]
    elsif artist.downcase.start_with? "an "
      artist[3]
    elsif artist.downcase.start_with? "the "
      artist[4]
    else
      artist[0]
    end
    letter.upcase
  end
end
