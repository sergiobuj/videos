class AddAvailableToMovie < ActiveRecord::Migration
  def self.up
    add_column :movies, :available, :boolean
  end

  def self.down
    remove_column :movies, :available
  end
end
