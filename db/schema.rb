# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101220212626) do

  create_table "enquiries", :force => true do |t|
    t.text     "comment"
    t.integer  "listing_id",                             :null => false
    t.integer  "user_id",                                :null => false
    t.date     "available_date_from"
    t.date     "available_date_to"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "enquiry_type",                           :null => false
    t.string   "status",              :default => "new", :null => false
  end

  add_index "enquiries", ["listing_id"], :name => "fk_enquiry_to_listing"
  add_index "enquiries", ["user_id"], :name => "fk_enquiry_to_user"

  create_table "listings", :force => true do |t|
    t.integer  "price"
    t.date     "available_date_from"
    t.date     "available_date_to"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "property_id",         :default => 0, :null => false
    t.integer  "user_id",             :default => 0, :null => false
  end

  add_index "listings", ["property_id"], :name => "fk_listing_to_property"
  add_index "listings", ["user_id"], :name => "fk_listing_to_user"

  create_table "photos", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "property_id",        :default => 0, :null => false
  end

  add_index "photos", ["property_id"], :name => "fk_listing_to_property"

  create_table "properties", :force => true do |t|
    t.string   "street_name"
    t.integer  "street_number"
    t.string   "street_type"
    t.string   "suburb"
    t.string   "state"
    t.string   "postcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "login",                            :null => false
    t.string   "email",                            :null => false
    t.string   "crypted_password",                 :null => false
    t.string   "persistence_token",                :null => false
    t.integer  "login_count",       :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
