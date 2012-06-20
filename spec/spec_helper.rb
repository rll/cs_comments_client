plugin_test_dir = File.dirname(__FILE__)

$LOAD_PATH.unshift(File.join(plugin_test_dir, '..', 'lib'))
$LOAD_PATH.unshift(plugin_test_dir)
require 'rspec'
require 'comment_client'
require 'active_record'
require 'rest_client'
require 'yajl'

require 'logger'

ActiveRecord::Base.logger = Logger.new(File.join(plugin_test_dir, "debug.log"))

ActiveRecord::Base.configurations = YAML::load_file(File.join(plugin_test_dir, "db", "database.yml"))
ActiveRecord::Base.establish_connection(ENV["DB"] || "sqlite3")
ActiveRecord::Migration.verbose = false

load(File.join(plugin_test_dir, "db", "schema.rb"))
# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

class Question < ActiveRecord::Base
end
