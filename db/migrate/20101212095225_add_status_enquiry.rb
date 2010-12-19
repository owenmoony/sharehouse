class AddStatusEnquiry < ActiveRecord::Migration
  def self.up
    execute "alter table enquiries add column status varchar(255) not null default 'new';"
  end

  def self.down
    execute "alter table enquiries drop column status"
  end
end
