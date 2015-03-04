class Song < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title, :artist

  def self.unvetoed
    where vetoed: false
  end
end
