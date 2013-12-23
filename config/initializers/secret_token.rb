# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

Tweegifts::Application.config.secret_key_base = secure_token
#Tweegifts::Application.config.secret_key_base = '535f30cc7f367ed0b7e37804a86c92f36981c13fed3ff293b2821590a5c59161f065e84a86671b7574ea14880eeb337aa9e3108a5672a56ce62782d512c61f69'
