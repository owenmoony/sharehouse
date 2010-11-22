# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sharehouse_session',
  :secret      => '8389df7ebd5b543fc5aa458a26799ac7db2f34a786753e5d30815636414d00ba657c33ed0c0731445a5d4f18b3963836566a171555f1f2e602d876362a0344b2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
