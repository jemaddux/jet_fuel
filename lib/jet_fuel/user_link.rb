require "sinatra/activerecord"
require "active_record"

module JetFuel
  class UserLink < ActiveRecord::Base
    validates_presence_of :full_url, :short_url, :relative_short_url, :user_id
    belongs_to :user

    def self.create_user_link(url,vanity,user_id)
      relative_link = generate_relative_link(10)
      user_link = UserLink.create(:full_url => check_url(url), 
        :short_url => "jetfuel.herokuapp.com/jf/#{vanity}/#{relative_link}", 
        :relative_short_url => relative_link, 
        :vanity => vanity,
        :created_at => Time.now,
        :visits_count => 0,
        :user_id => user_id,
        :updated_at => Time.now
        )
    end

    def self.check_url(url)
      ("http://" + url) unless (url[0..6] == "http://")
    end
    
    def self.get_redirect(redirect)
      user_link = UserLink.find_by_relative_short_url(redirect)
      begin
        user_link.visits_count += 1
        user_link.save
      rescue

      end
      user_link
    end

    def self.generate_relative_link(length)
      x ||= [('a'..'z'),('A'..'Z'),('0'..'9')].map{|i| i.to_a}.flatten
      (0..(length-1)).map{ x[rand(x.length)] }.join
    end

    def self.shorten(url,vanity,user_id)
      #if url_exist?(url)
       # user_link = UserLink.find_by_full_url(url)
      #else
        user_link = create_user_link(url,vanity,user_id) 
      #end
      #user_link
    end

    def self.url_exist?(url)
      UserLink.where(full_url: url).count > 0
    end

  end
end
