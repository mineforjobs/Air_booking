# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Air_booking_session',
  :secret      => '703c8ae261422e3e4e66e361568c9ce0240c1a40e7d614dc5dee4c0854c4b2f0552fa4ba45b8991ab2325c1422731ebc63181bf0ee886b680b52c87c170f0e8f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
