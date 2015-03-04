class Song < ActiveRecord::Base
  belongs_to :user

  def self.unvetoed
    where vetoed: false
  end
end
