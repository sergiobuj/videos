class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.integer :emp_code
      t.integer :emp_id
      t.string :emp_name
      t.string :emp_surname
      t.string :emp_state
      t.date :start_date
      t.string :home_address

      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end
