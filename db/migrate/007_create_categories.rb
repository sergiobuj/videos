class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.integer :category_code
      t.integer :rent_price
      t.integer :rent_days

      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
