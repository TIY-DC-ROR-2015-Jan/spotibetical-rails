class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :name
      t.string :spotify_link
      t.string :spotify_id

      t.timestamps null: false
    end
  end
end
