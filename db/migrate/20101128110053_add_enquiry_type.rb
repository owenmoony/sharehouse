class AddEnquiryType < ActiveRecord::Migration
  def self.up
    execute "alter table enquiries add column enquiry_type varchar(255) not null;"
  end

  def self.down
    execute "alter table enquiries drop column enquiry_type"
  end
end
