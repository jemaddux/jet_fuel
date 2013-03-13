module JetFuel
  class Server < Sinatra::Base
    register Sinatra::ActiveRecordExtension

    set :database, (ENV["DATABASE_URL"] || "sqlite3:///db/jet_fuel.sqlite3")

    set :views, './views'

    get "/" do
      @top_links = Link.order("visits_count").reverse
      erb :index
    end

    get "/join" do
      erb :join
    end

    post "/join" do
      User.create_user(params["username"], params["password"])
      redirect "/user/#{params["username"]}"
    end

    post "/login" do
      if User.login_allowed?(params[:username],params[:password])
        begin
          user = User.find_by_name(params[:username])        
          redirect "/user/#{params[:username]}"
        rescue
          redirect '/'
        end
      else
        redirect "/"
      end
    end

    get "/user" do
      @user = User.find_by_name("guest")
      @user_links = UserLink.find_all_by_user_id(@user.id)
      erb :user
    end

    get "/user/:username" do
      @user = User.find_by_name(params[:username])
      @user_links = UserLink.find_all_by_user_id(@user.id)
      erb :user
    end    

    get "/jf/:redirect" do
      link = Link.get_redirect(params[:redirect])
      begin
        redirect "#{Link.check_url(link.full_url)}"
      rescue
        "error, no url"
      end
    end

    get "/jf/:vanity/:redirect" do
      user_link = UserLink.get_redirect(params[:redirect])
      begin
        redirect "#{Link.check_url(user_link.full_url)}"
      rescue
        "error, no url"
      end
    end

    post '/shorten' do
      link = Link.shorten(params["url"])
      relative_short_url = link.relative_short_url
      redirect "/shorten/#{relative_short_url}"
    end

    post '/user_shorten/:username' do
      user = User.find_by_name(params[:username])
      user_link = UserLink.shorten(params["url"], params["vanity"],user.id)
      relative_short_url = user_link.relative_short_url
      redirect "/shorten/#{relative_short_url}"
    end

    get  "/shorten/:relative_short_url" do
      @link = Link.find_by_relative_short_url(params[:relative_short_url])
      if @link.nil?
        @link = UserLink.find_by_relative_short_url(params[:relative_short_url])
      end
      erb :shortened
    end

  end
end
