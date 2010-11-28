class AddEnquires < ActiveRecord::Migration
  def self.up
    sql = <<SQL
CREATE TABLE enquiries (
  id int(11) NOT NULL AUTO_INCREMENT,
  `comment` text,
  listing_id int(11) NOT NULL,
  user_id int(11) not null,
  available_date_from date DEFAULT NULL,
  available_date_to date DEFAULT NULL,
  created_at datetime DEFAULT NULL,
  updated_at datetime DEFAULT NULL,
  PRIMARY KEY (id),
  KEY fk_enquiry_to_listing (listing_id),
  KEY fk_enquiry_to_user (user_id),
  CONSTRAINT fk_enquiry_to_user FOREIGN KEY (user_id) REFERENCES users (id),
  CONSTRAINT fk_enquiry_to_listing FOREIGN KEY (listing_id) REFERENCES listings (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SQL
    execute sql
  end

  def self.down
    executed "drop table enquiries"
  end
end
