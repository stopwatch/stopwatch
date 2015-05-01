source 'https://rubygems.org'

ruby '2.2.2'

# Globals dependencies
gem 'rails', '4.2.1'
gem 'pg'
gem 'jsonapi-resources'

# Production environment dependencies
group :production, :staging do
end

# Development environment dependencies (also needed by test environement)
group :development, :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers', require: false
  gem 'factory_girl_rails'
  gem 'faker'

  gem 'byebug'

  gem 'spring'
  gem 'spring-commands-rspec'
end

# Development environment only dependencies
group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'web-console', '~> 2.0'
end
