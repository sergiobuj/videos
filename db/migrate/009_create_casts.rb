class CreateCasts < ActiveRecord::Migration
  def self.up
      drop_table :casts
    
  end

  def self.down
create_table :casts do |t|
      t.integer :movie_code
      t.string :actor_actress_name

      t.timestamps
    end
  end
end
