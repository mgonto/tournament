require 'rails/application'
require 'rubygems'
require 'spork'
require 'webmock/rspec'
require 'vcr'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  # IMPORTANT: If you have problems,
  # see https://github.com/sporkrb/spork/wiki/Spork.trap_method-Jujitsu

  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] ||= 'test'

  require "rails/mongoid"
  Spork.trap_class_method(Rails::Mongoid, :load_models)

  # Prevent main application to eager_load in the prefork block (do not load files in autoload_paths)
  Spork.trap_method(::Rails::Application, :eager_load!)

  require File.expand_path("../../config/environment", __FILE__)

  # Load all railties files
  Rails.application.railties.all { |r| r.eager_load! }

  require 'rspec/rails'
  require 'rspec/autorun'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|

    # config.mock_with :mocha

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false
    config.include Devise::TestHelpers, :type => :controller
    config.order = "random"

    # Clean up the database
    require 'database_cleaner'
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.orm = "mongoid"


    config.before(:each) do
      DatabaseCleaner.clean
    end

    ##Mongo matchers
    require 'mongoid-rspec'
    config.include Mongoid::Matchers

    #json spec configuration
    require "json_spec"
    config.include JsonSpec::Helpers
    JsonSpec.configure do
      exclude_keys "created_at", "updated_at", "_id"
    end

    # If you only want to run a given spec, put :focus on it.
    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.filter_run :focus => true
    config.run_all_when_everything_filtered = true
  end

end

Spork.each_run do
  # This code will be run each time you run your specs.

  VCR.configure do |c|
    c.cassette_library_dir = 'spec/vcr_cassettes/'
    c.hook_into :webmock # or :fakeweb
  end

  Fabrication.clear_definitions
end

