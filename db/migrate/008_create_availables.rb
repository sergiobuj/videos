class CreateAvailables < ActiveRecord::Migration
  def self.up
    create_table :availables do |t|
      t.integer :movie_code
      t.boolean :available

      t.timestamps
    end
  end

  def self.down
    drop_table :availables
  end
end
