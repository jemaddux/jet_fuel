require "sinatra/activerecord"
require "active_record"

module JetFuel
  class Link < ActiveRecord::Base
    

    def self.shorten(url)
      relative_link = generate_relative_link(10)
      link = "jetfuel.herokuapp.com/jf/#{relative_link}"
      link
    end

    def self.generate_relative_link(length)
      x ||= [('a'..'z'),('A'..'Z'),('0'..'9')].map{|i| i.to_a}.flatten
      (0..(length-1)).map{ x[rand(x.length)] }.join
    end
  end
end
