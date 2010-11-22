class ListingPropertyFkConstraint < ActiveRecord::Migration
  def self.up
    execute "alter table listings drop column property_id"
    execute "alter table listings add column (property_id int(11) NOT NULL default 0)"
    execute "alter table listings add constraint `fk_listing_to_property` foreign key (property_id) references properties(id)"
  end

  def self.down
    execute "ALTER TABLE `listings` DROP INDEX `fk_listing_to_property`"
  end
end