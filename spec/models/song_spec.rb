require 'rails_helper'

describe Song do
  it "allows users to veto songs" do
    user = User.create! email: "a@example.com", password: "password"
    song = Song.create!

    expect(Song.unvetoed).to include song

    user.veto! song
    expect(Song.unvetoed).not_to include song
  end

  it "validates that songs have titles"
end
