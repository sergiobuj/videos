class CreateRents < ActiveRecord::Migration
  def self.up
    create_table :rents do |t|
      t.integer :rent_code
      t.integer :movie_code
      t.integer :client_code
      t.integer :emp_code
      t.date :rent_date
      t.date :exp_date

      t.timestamps
    end
  end

  def self.down
    drop_table :rents
  end
end
