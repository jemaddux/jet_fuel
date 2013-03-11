require 'spec_helper'

describe 'server.rb' do
  include Rack::Test::Methods

  def app
    JetFuel::Server
  end

  before(:each) do
    #JetFuel::Database.delete_all
  end

  describe "Server class" do
    context "gets /" do
      it "returns 200" do
        get "/"
        last_response.status.should eq 200
      end
    end
  end
end
