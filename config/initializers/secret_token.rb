# Your secret key for verifying the integrity of signed cookies.

if File.exists? "#{Fisheye::Application.config.root}/tmp/cookie_token.rb"
  # Load the tokens stored in the temporary file
  require "#{Fisheye::Application.config.root}/tmp/cookie_token.rb"
else
  # If there isn't a secret token yet, create one automatically.
  if Fisheye::Application.config.secret_token.blank?
    require 'securerandom'
    Fisheye::Application.config.secret_token = SecureRandom.hex(64)
  end

  Dir.mkdir "#{Fisheye::Application.config.root}/tmp" # make sure the tmp directory exists (Heroku)
  # A cache file ensures the tokens will stay static across restarts.
  File.open("#{Fisheye::Application.config.root}/tmp/cookie_token.rb", 'w') do |token_cache|
    token_cache.puts "Fisheye::Application.config.secret_token = '#{Fisheye::Application.config.secret_token}'"
  end
end

