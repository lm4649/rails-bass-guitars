class AddYearToSongs < ActiveRecord::Migration[6.0]
  def change
    add_column :songs, :year, :integer
  end
end
