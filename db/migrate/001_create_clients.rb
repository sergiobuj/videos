class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.integer :client_code
      t.integer :client_id
      t.string :client_name
      t.string :client_surname
      t.date :sing_up_date
      t.date :birth_date
      t.string :client_state
      t.string :home_address

      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
