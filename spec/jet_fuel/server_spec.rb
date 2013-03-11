require 'spec_helper'

describe 'server.rb' do
  #include Rack::Test::Methods

  def app
    JetFuel::Server
  end

  before(:each) do
    #JetFuel::Database.delete_all
  end

  describe "Server class" do
    context "nothing" do
      it "nothing" do
        pending
      end
    end
  end
end
