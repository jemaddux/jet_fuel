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

      it "should have JetFuel on page" do
        visit '/'
        page.should have_content 'JetFuel'
      end
    end
  end
end

