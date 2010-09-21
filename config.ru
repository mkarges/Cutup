require 'cutup'  # original application
require 'thedocument'
require 'process'
require 'p_array'
require 'rearr'
require 'sequel'

#connect to db
DB = Sequel.connect('sqlite://development.db')
#DB = Sequel.connect('postgres://user:password@host:port/database_name')

cut = CutUp.new
doc = Doc.new
pro = Pro.new

builder = Rack::Builder.new do
	#middleware	
	use Rack::ShowExceptions
	use Rack::Reloader
	use Rack::Static, :urls => [ "/stylesheets" ] # did not specify root here, but probably should when site's live

	#url mapping
	map '/' do	
		run cut
	end
	
	map '/thedocument' do
		run doc
	end
	
	map '/process' do
		run pro	
	end
end

# rack this up
run builder 


#migrations
DB.create_table :temp do
  primary_key :id
  String :entry
end

DB.create_table :document do
  primary_key :id
  String :master
  String :title
end

