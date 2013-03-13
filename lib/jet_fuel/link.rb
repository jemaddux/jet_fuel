require "sinatra/activerecord"
require "active_record"

module JetFuel
  class Link < ActiveRecord::Base
    validates_presence_of :full_url, :short_url, :relative_short_url, :user_id

    def self.shorten(url)
      if url_exist?(url)
        link = Link.find_by_full_url(url)
      else
        link = make_link(url) 
      end
      link
    end

    def self.url_exist?(url)
      Link.where(full_url: url).count > 0
    end

    def self.get_redirect(redirect)
      link = Link.find_by_relative_short_url(redirect)
      begin
        link.visits_count += 1
        link.save
      rescue

      end
      link
    end

    def self.make_link(url)
      relative_link = generate_relative_link(10)
      link = Link.create(:full_url => url, 
        :short_url => "jetfuel.herokuapp.com/jf/#{relative_link}", 
        :relative_short_url => relative_link, 
        :user_id => 0,
        :created_at => Time.now,
        :visits_count => 0,
        :updated_at => Time.now
        )
    end

    def self.check_url(url)
      ("http://" + url) unless (url[0..6] == "http://")
    end

    def self.generate_relative_link(length)
      x ||= [('a'..'z'),('A'..'Z'),('0'..'9')].map{|i| i.to_a}.flatten
      (0..(length-1)).map{ x[rand(x.length)] }.join
    end
  end
end
