class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :album
      t.references :genre, null: false, foreign_key: true
      t.references :bass, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true
      t.string :youtube_url

      t.timestamps
    end
  end
end
