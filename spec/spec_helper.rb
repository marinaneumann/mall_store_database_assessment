require 'rspec'
require 'malls'
require 'stores'
require 'pg'

DB = PG.connect({:dbname => 'mall_store_test'})

RSpec.configure do |config|
	config.after(:each) do 
		DB.exec("DELETE FROM malls *;")
		DB.exec("DELETE FROM stores *;")
		DB.exec("DELETE FROM directory *;")
	end
end