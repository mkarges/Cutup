require 'cutup'  # original application
require 'thedocument'
require 'process'
require 'p_array'
require 'rearr'

cut = CutUp.new
doc = Doc.new
pro = Pro.new

builder = Rack::Builder.new do
	#middleware	
	use Rack::ShowExceptions
	use Rack::Reloader
	use Rack::Static, :urls => [ "/stylesheets" ] # did not specify root here, but probably should when site's live
   # use Rack::Session::Cookie, :key => 'rack.session',
   #                             :path => '/',
   #                            :expire_after => 2592000,
   #                            :secret => '...'
	
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


