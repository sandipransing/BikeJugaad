require 'spork'
require 'factory_girl'

require 'simplecov'
SimpleCov.start 'rails'


Spork.prefork do
  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.include FactoryGirl::Syntax::Methods
    config.include Devise::TestHelpers, :type => :controller
    config.mock_with :rspec

    config.expect_with :rspec do |c|
      c.syntax = :expect
    end

    config.before(:each) do
      Mongoid.default_session.collections.each {|c| c.find.remove_all unless %w[vehicle, user].include?(c.name) }
    end

    config.include Mongoid::Matchers
  end

end
