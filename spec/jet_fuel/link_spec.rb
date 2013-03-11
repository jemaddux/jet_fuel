require 'spec_helper'

describe 'link.rb' do
  include Rack::Test::Methods
  Capybara.app = JetFuel::Server

  def app
    JetFuel::Link
  end

  before(:each) do
    #JetFuel::Database.delete_all
  end

  describe "Link class", :type => :feature do
    
  end
end
