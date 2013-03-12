require 'spec_helper'

describe 'link.rb' do
  include Rack::Test::Methods
  #Capybara.default_driver = :selenium
  Capybara.app = JetFuel::Server

  def app
    JetFuel::Link
  end

  before(:each) do
    #JetFuel::Database.delete_all
  end

  describe "Link class", :type => :feature do
    context ".shorten" do
      it "shortens the link" do
        short_url = JetFuel::Link.shorten("http://google.com")
        short_url.short_url.should have_content 'jetfuel.herokuapp.com/jf/'
      end

      it "return the same shortened link when a url is saved twice" do
        short_url1 = JetFuel::Link.shorten("http://google.com")
        short_url2 = JetFuel::Link.shorten("http://google.com")
        short_url1.should eq short_url2
      end
    end
  end
end
