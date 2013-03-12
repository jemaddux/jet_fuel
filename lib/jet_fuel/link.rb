require "sinatra/activerecord"
require "active_record"

module JetFuel
  class Link < ActiveRecord::Base
    validates_presence_of :full_url, :short_url, :relative_short_url, :user_id

    def self.shorten(url)
      if unique_url?
        link = make_link(url) 
      else
        link = Link.find(:full_url => url)
      end
      link.short_url
    end

    def self.unique_url?
      true
    end

    def self.make_link(url)
      relative_link = generate_relative_link(10)
      Link.create(
        full_url: url,
        short_url: "jetfuel.herokuapp.com/jf/#{relative_link}",
        relative_short_url: relative_link
      )
    end

    def self.generate_relative_link(length)
      x ||= [('a'..'z'),('A'..'Z'),('0'..'9')].map{|i| i.to_a}.flatten
      (0..(length-1)).map{ x[rand(x.length)] }.join
    end
  end
end
