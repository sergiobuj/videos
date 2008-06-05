class CreateReturns < ActiveRecord::Migration
  def self.up
    create_table :returns do |t|
      t.integer :rent_code
      t.date :return_date
      t.integer :charges ,     :default => 0


      t.timestamps
      rename_table :return, :r_eturn
    end
  end

  def self.down
  rename_table :r_eturn, :return
    drop_table :returns
  end
end
