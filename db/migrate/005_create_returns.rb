class CreateReturns < ActiveRecord::Migration
  def self.up
    create_table :returns do |t|
      t.integer :rent_code
      t.date :return_date
      t.integer :charges

      t.timestamps
    end
  end

  def self.down
    drop_table :returns
  end
end
