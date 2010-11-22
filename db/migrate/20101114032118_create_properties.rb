class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
      t.string :street_name
      t.integer :street_number
      t.string :street_type
      t.string :suburb
      t.string :state
      t.string :postcode
      t.timestamps
    end
  end

  def self.down
    drop_table :properties
  end
end
