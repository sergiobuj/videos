class CreatePhones < ActiveRecord::Migration
  def self.up
  
  
  
  

    
    
    drop_table :phones
  end

  def self.down
    create_table :phones do |t|
      t.integer :code_person
      t.string :phone_number

      t.timestamps
    end  
  
  
    
  end
end
