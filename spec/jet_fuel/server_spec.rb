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
    context "gets /" do 
      it "returns 200" do
        get "/"
        last_response.status.should eq 200
      end

      it "has JetFuel on page" do
        visit '/'
        page.should have_content 'JetFuel'
      end

      it "has shorten a link on a page" do
        visit '/'
        page.should have_content "Shorten"
      end

      it "has a login and password box" do
        visit '/'
        page.should have_content "Login"
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
    
  end
end

