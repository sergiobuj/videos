class AddNameToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :category_name, :string
  end

  def self.down
    remove_column :categories, :category_name
  end
end
