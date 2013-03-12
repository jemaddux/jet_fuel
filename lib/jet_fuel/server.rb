module JetFuel
  class Server < Sinatra::Base
    register Sinatra::ActiveRecordExtension

    set :database, "sqlite3:///db/jet_fuel.sqlite3"

    set :views, './views'

    get "/" do
      erb :index
    end

  end
end
