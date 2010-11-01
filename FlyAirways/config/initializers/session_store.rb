# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Air_booking_system_session',
  :secret      => '61be30f7f1f1ead74e6f4f5e22b54431cb5a1ee2582f2f2879f20fd533c6c654877c094b8d73bc4ea8bf3f9acd6901bce82215664366257795dc93dc040b38a3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
