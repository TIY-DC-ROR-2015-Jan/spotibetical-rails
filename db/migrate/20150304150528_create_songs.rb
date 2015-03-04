class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :title
      t.belongs_to :user, index: true
      t.string :spotify_id
      t.boolean :vetoed, null: false, default: false
      t.string :play_link
      t.string :preview_link

      t.timestamps null: false
    end
    add_foreign_key :songs, :users
  end
end
