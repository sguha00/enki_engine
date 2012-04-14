require ::File.expand_path('../config/environment',  __FILE__)

ActiveRecord::Base.connection
ActiveRecord::Migrator.up([File.expand_path('../../../db/migrate', __FILE__)]) { |migration| true }

run Dummy::Application
