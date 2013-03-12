require "jet_fuel/version"
require "jet_fuel/server"
require "jet_fuel/link"
require "active_record"
require "sinatra/activerecord"


module JetFuel
  set :database, "sqlite3:///jet_fuel.sqlite3"
  class DataBase < Sinatra::Base
    register Sinatra::ActiveRecordExtension
  end

  


end
