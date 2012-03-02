source 'https://rubygems.org'

# Globals dependencies
gem 'rails', '3.2.2'

# Assets dependencies
group :assets do
  gem 'jquery-rails'
  gem 'sass-rails',     '~> 3.2'
  gem 'uglifier',       '~> 1.0'
  gem 'compass',        '~> 0.12.rc'
  gem 'bourbon',        '~> 1.4'
  gem 'bootstrap-sass', '~> 2.0.1'
end

# Production environment dependencies
group :production, :staging do
end

# Development environment dependencies (also needed by test environement)
group :development, :test do
  gem 'sqlite3'

  gem 'rspec-rails'
  gem 'spork', '~> 0.9.0'

  gem 'ruby-debug19', require: 'ruby-debug'
  gem 'pry-rails'
  gem 'pry-remote'
  gem 'hirb-unicode'

  gem 'simplecov',    require: false

  gem 'redcarpet'
  gem 'yard', '~> 0.7.5'
end

# Dependencies should be load only in development environment
group :development do
end

# Guard dependencies
group :guard do
  gem 'guard'

  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'guard-spork'
  # gem 'guard-jasmine'
  gem 'guard-pow'
  gem 'guard-livereload'

  gem 'rb-readline'

  gem 'rb-fsevent', require: false
  gem 'ruby_gntp',  require: false
end

