# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_guyd_session',
  :secret      => '6250107fb1deded47844e33b332f4e67120193fc696fec76710ba533a800f4543a2d9b357c5b2e6d2b132cd9f16101f9424b7363ebdfa21e8a73773a2efe3456'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
