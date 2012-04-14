# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'

# See http://reinteractive.net/posts/2-start-your-engines for useful info regarding testing Engines.
require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'

# Add engine url_helpers to the base test app as we are testing the 
# engine works not whether rails routing proxies work.
::ApplicationController.send :include, Enki::Engine.routes.url_helpers

ENGINE_RAILS_ROOT = File.expand_path('../../', __FILE__)

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")].each {|f| require f }

RSpec.configure do |config|
  require 'rspec/expectations'

  config.include RSpec::Matchers
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true
  
  # Ensure the routes used by Rspec are the engine ones
  config.include RoutesOverrideHelper
  # Make the engines route helpers available to Rspec.
  config.include Enki::Engine.routes.url_helpers
  
  config.before(:all) do
    ActiveRecord::Migration.verbose = false
    ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
    ActiveRecord::Migrator.up([File.expand_path('../../db/migrate', __FILE__)]) { |migration| true }
  end
end

module DisableFlashSweeping
  def sweep
  end
end
