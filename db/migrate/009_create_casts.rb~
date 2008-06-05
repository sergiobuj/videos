class CreateCasts < ActiveRecord::Migration
  def self.up
    create_table :casts do |t|
      t.integer :movie_code
      t.string :actor_actress_name

      t.timestamps
    end
  end

  def self.down
    drop_table :casts
  end
end
