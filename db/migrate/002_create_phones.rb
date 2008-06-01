class CreatePhones < ActiveRecord::Migration
  def self.up
    create_table :phones do |t|
      t.integer :code_person
      t.string :phone_number

      t.timestamps
    end
  end

  def self.down
    drop_table :phones
  end
end
