# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_whereis_session',
  :secret      => '2e54c5a9ac5a9ed41fb057ae779cf9e74f9b42d8133af3d4270363e0391781cae7c007ec0c0c5539cdb518d53bd480fac71ff0a6e1b450fb0a95c7d305cc3c00'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
