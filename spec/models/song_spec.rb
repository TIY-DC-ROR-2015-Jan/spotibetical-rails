require 'rails_helper'

describe Song do
  it "allows users to veto songs" do
    user = User.create! email: "a@example.com", password: "password"
    song = Song.create! title: "A Thing", artist: "The People"

    expect(Song.unvetoed).to include song

    user.veto! song
    expect(Song.unvetoed).not_to include song
  end

  it "validates that songs have titles" do
    expect do
      Song.create!
    end.to raise_error ActiveRecord::RecordInvalid
  end

  it "knows how to sort by letter" do
    { 
      "The The"            => "T",
      "Aerosmith"          => "A",
      "A Perfect Circle"   => "P",
      "blink-182"          => "B",
      "An Other Albatross" => "O"
    }.each do |name, expect_letter|
      s = Song.new artist: name
      expect(s.sort_letter).to eq expect_letter
    end
  end
end
