require 'spec_helper'

describe 'user_link.rb' do
  include Rack::Test::Methods
  #Capybara.default_driver = :selenium
  Capybara.app = JetFuel::Server

  def app
    JetFuel::UserLink
  end

  before(:each) do
    #JetFuel::Database.delete_all
  end

  describe "UserLink class", :type => :feature do
    context ".shorten" do
      it "shortens the link" do
        short_url = JetFuel::UserLink.shorten("http://google.com")
        short_url.short_url.should have_content 'jetfuel.herokuapp.com/jf/'
      end

      it "return the same shortened link when a url is saved twice" do
        short_url1 = JetFuel::UserLink.shorten("http://google.com")
        short_url2 = JetFuel::UserLink.shorten("http://google.com")
        short_url1.should eq short_url2
      end
    end
  end
end
