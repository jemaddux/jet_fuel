require "bundler/gem_tasks"
require 'active_record'
require 'yaml'
require "sinatra/activerecord/rake"
require "./lib/jet_fuel/link"

ActiveRecord::Base.establish_connection(  
    :adapter => "sqlite3",  
    :host => "localhost",  
    :database => "jet_fuel.sqlite3"  
) 

