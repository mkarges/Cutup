require 'sequel'
require './proc'
require './template'

#connect to db
DB = 
Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://development.db')
#Sequel.connect('sqlite://development.db')

cut = Cut.new
doc = Doc.new
pro = Pro.new
how = How.new
his = His.new

builder = Rack::Builder.new do
	#middleware	
	use Rack::ShowExceptions
	use Rack::Reloader
	use Rack::Static, :urls => [ "/stylesheets", "/images" ] # did not specify root here, but probably should when site's live

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
	
	map '/how' do
	  run how
  end
  
  map '/history_of_cutup' do
    run his
  end
  
end

# rack this up
run builder 


#migration #1
#DB.create_table :temp do
#  primary_key :id
#  String :entry
#end

#migration #2
#DB.create_table :document do
#  primary_key :id
#  String :master
#  String :title
#end

#migration #3
#DB.alter_table(:temp) do
#  set_column_type :entry, String, :text => true
#end
#DB.alter_table(:document) do
#  set_column_type :master, String, :text => true
#end


