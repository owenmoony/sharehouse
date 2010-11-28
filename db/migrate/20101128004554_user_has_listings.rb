class UserHasListings < ActiveRecord::Migration
  def self.up
    execute "alter table listings add column (user_id int(11) NOT NULL default 0)"
    execute "alter table listings add constraint `fk_listing_to_user` foreign key (user_id) references users(id)"
  end

  def self.down
    execute "alter table listings drop column user_id"
  end
end
