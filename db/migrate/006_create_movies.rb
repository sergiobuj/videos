class CreateMovies < ActiveRecord::Migration
  def self.up
    create_table :movies do |t|
      t.integer :movie_code
      t.string :movie_title
      t.string :movie_original_title
      t.integer :movie_year
      t.string :movie_director
      t.string :genre
      t.string :country
      t.string :place_in_store
      t.integer :category_code

      t.timestamps
    end
  end

  def self.down
    drop_table :movies
  end
end
