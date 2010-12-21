class CreatePhotoTable < ActiveRecord::Migration
  def self.up
    execute "alter table properties drop column photo_file_name;"
    execute "alter table properties drop column photo_file_size;"
    execute "alter table properties drop column photo_content_type;"
    execute "alter table properties drop column photo_updated_at;"
    sql = <<HEREDOC
create table photos(
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `photo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_file_size` int(11) DEFAULT NULL,
  `photo_updated_at` datetime DEFAULT NULL,
  `property_id` int(11) NOT NULL DEFAULT '0',
   PRIMARY KEY (`id`),
   KEY `fk_listing_to_property` (`property_id`),
   CONSTRAINT `fk_photo_to_property` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
HEREDOC
    execute sql
  end

  def self.down
    sql = <<HEREDOC
alter table properties add column(
  `photo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_file_size` int(11) DEFAULT NULL,
  `photo_updated_at` datetime DEFAULT NULL)
HEREDOC
    execute sql
    execute "drop table photos"
  end
end
