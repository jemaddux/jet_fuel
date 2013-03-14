require 'spec_helper'

describe 'user.rb' do
  include Rack::Test::Methods
  #Capybara.default_driver = :selenium
  Capybara.app = JetFuel::Server

  def app
    JetFuel::User
  end

  before(:each) do
    #JetFuel::Database.delete_all
  end

  describe "User class", :type => :feature do
    context ".salt_the_password" do
      it "returns a salty password" do
        x = JetFuel::User.salt_the_password("password","gPqPvwCDxBQEl1nLKzTA")
        x.should eq "478deced2faf0189dbdaf5ef3c280af123533e0b"
      end
    end

    context ".nacl" do
      it 'returns a bunch of salt' do
        x = JetFuel::User.nacl(20)
        x.length.should eq 20
      end
    end

    context ".create_user" do
      it "returns a new user" do
        user = JetFuel::User.create_user("username","password")
        user.name.should eq "username"
      end
    end

    context ".login_allowed?" do
      it "return true" do
        user = JetFuel::User.create_user("username","password")
        user.name.should eq "username"
        x = JetFuel::User.login_allowed?("username","password")
        x.should eq true
      end
    end
  end

end
























