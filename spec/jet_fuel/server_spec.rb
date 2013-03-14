require 'spec_helper'

describe 'server.rb' do
  include Rack::Test::Methods
  Capybara.app = JetFuel::Server

  def app
    JetFuel::Server
  end

  before(:each) do
    #JetFuel::Database.delete_all
  end

  describe "Server class", :type => :feature do
    context "post" do
      # it "/join returns 500" do
      #   post "/join", :params => {"username" => "username", "password" => "password"}
      #   last_response.status.should eq 5000
      # end

      # it "/login returns 500" do
      #   post "/join", :params => {"username" => "username", "password" => "password"}
      #   post "/login", :params => {"username" => "username", "password" => "password"}
      #   last_response.status.should eq 5000
      # end
    end

    context "gets /" do 
      it "returns 200" do
        get "/"
        last_response.status.should eq 200
      end

      it "has JetFuel on page" do
        visit '/'
        page.should have_content 'JetFuel'
      end

      it "has a top links" do
        visit '/'
        page.should have_content "Top Links"
      end

      it "redirects to a shortened link page when shorten button is clicked" do
        visit "/"
        fill_in :url, :with => "http://google.com"
        click_button 'shorten_button'
        page.should have_content 'Your shortened link:'
      end

      it "has a shortened link on the page when shorten link is clicked" do
        visit "/"
        fill_in :url, :with => "http://google.com"
        click_button 'shorten_button'
        page.should have_content 'jetfuel.herokuapp.com'
      end

      it "has a join now button which redirects to joing page" do
        visit "/"
        click_button 'join_button'
        page.should have_content 'Join Now'
      end
    end

    context "/user" do
      it "has stuff" do
        visit "/user"
        page.should have_content "JetFuel"
        page.should have_content "User"
      end
    end

    context "post /user/:username" do
      it "returns the user page" do
        visit "/user/harry"
        page.should have_content "harry"
      end
    end
    
  end
end














