class CreatePlaylistSongs < ActiveRecord::Migration
  def change
    create_table :playlist_songs do |t|
      t.belongs_to :song, index: true
      t.belongs_to :playlist, index: true

      t.timestamps null: false
    end
    add_foreign_key :playlist_songs, :songs
    add_foreign_key :playlist_songs, :playlists
  end
end
