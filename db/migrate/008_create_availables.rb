class CreateAvailables < ActiveRecord::Migration
  
  def self.up
    drop_table :availables
  end
  
  def self.down
    create_table :availables do |t|
      t.integer :movie_code
      t.boolean :available

      t.timestamps
    end
  end


end

