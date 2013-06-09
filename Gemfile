source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Heroku/production deployments use PostgreSQL
group :development, :staging do
  gem "pg"
end

# And local development/testing uses SQLite
group :development, :test do
  gem 'sqlite3'
  gem 'jazz_hands'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'brakeman'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

# Use Puma as our web server
gem "puma"

gem 'browserid-provider', '~> 0.5.5'
gem 'masq', '~> 0.2.8'
