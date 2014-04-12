source 'https://rubygems.org'

gem 'rails', '~> 3.2.16'

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
  gem 'jquery-rails'
end

gem 'browserid-provider'
gem 'masq', '~> 0.3.2'
