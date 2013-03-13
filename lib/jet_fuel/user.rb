module JetFuel
  class User < ActiveRecord::Base
    validates_presence_of :name, :salt, :encrypted_password
    has_many :user_links, dependent: :destroy

    def self.create_user(username,password)
      if user_exist?(username)
        #do nothing
      else
        user = User.create(:name => username, 
          :salt => "SALT", 
          :encrypted_password => encrypt_password(password), 
          :created_at => Time.now,
          :updated_at => Time.now
          )
      end
    end

    def self.login_allowed?(username,password)
      true
    end

    def self.encrypt_password(password)
      password + "now encrypted"
    end

    def self.user_exist?(username)
      User.where("name" => username).count > 0
    end

  end
end
