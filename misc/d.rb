require "rack"

module D
  class Server < ::Rack::Server
    def app
      Rack::Directory.new(Dir.pwd)
    end
  end
end