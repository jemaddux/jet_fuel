module JetFuel
  class Server < Sinatra::Base
    register Sinatra::ActiveRecordExtension

    set :database, "sqlite3:///db/jet_fuel.sqlite3"

    set :views, './views'

    get "/" do
      @top_links = Link.order("visits_count")
      erb :index
    end

    get "/jf/:redirect" do
      link = Link.get_redirect(params[:redirect])
      begin
        redirect "#{link.full_url}"
      rescue
        "error, no url"
      end
    end

    post '/shorten' do
      link = Link.shorten(params["url"])
      relative_short_url = link.relative_short_url
      redirect "/shorten/#{relative_short_url}"
    end

    get  "/shorten/:relative_short_url" do
      @link = Link.find_by_relative_short_url(params[:relative_short_url])
      erb :shortened
    end

  end
end
