class CreateListings < ActiveRecord::Migration
  def self.up
    create_table :listings do |t|
      t.integer :property_id
      t.integer :price
      t.date :available_date_from
      t.date :available_date_to
      t.timestamps
    end
  end

  def self.down
    drop_table :listings
  end
end
