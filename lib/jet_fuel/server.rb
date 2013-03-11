require 'sinatra'

module JetFuel
  class Server < Sinatra::Base
    set :views, './views'

    get "/" do
      erb :index
    end

  end
end
