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
        find_field('username').value.should eq 'user@email.com'
        find_field('password').value.should eq 'password'
      end

      it "redirects to a shortened link page when shorten button is clicked" do
        pending
      end

      it "redirects to a user page when login is clicked" do
        pending
      end

      it "has a join now button" do
        pending
      end

      it "redirects to join page whe joing now button is clicked" do
        pending
      end
    end

    context "gets /jf/shorten" do
      
    end

    context "post /jf/login" do

    end


  end
end

