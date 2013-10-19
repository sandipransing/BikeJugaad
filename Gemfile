source 'https://rubygems.org'

gem 'rails', '3.2.15'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


gem 'json'

# Gems used only for assets and not required
# in production environments by default.

platform :ruby do
  gem 'rmagick'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

#Image
gem 'fog'
gem 'mongoid-grid_fs', github: 'gautamrege/mongoid-grid_fs'
gem 'carrierwave-mongoid', '~> 0.6.0', :require => 'carrierwave/mongoid'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'
gem 'capistrano', '~> 2.15'
gem "devise"
gem "haml", ">= 3.0.0"
gem "haml-rails"
gem "jquery-rails"
gem "bson_ext"
gem "mongoid", ">= 2.0.0.beta.19"

group :test do
  gem "capybara"
  gem 'rspec-rails', '>= 2.0.1'
  gem 'spork'
  gem 'factory_girl_rails'
  gem 'mongoid-rspec'
  gem 'simplecov'
end

