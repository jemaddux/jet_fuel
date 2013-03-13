module JetFuel
  class User < ActiveRecord::Base
    validates_presence_of :name, :salt, :encrypted_password
    has_many :user_links, dependent: :destroy

    def self.create_user(username,password)
      if user_exist?(username)
        #do nothing
      else
        secret_salt = nacl(20)
        user = User.create(:name => username, 
          :salt => secret_salt, 
          :encrypted_password => salt_the_password(password,secret_salt), 
          :created_at => Time.now,
          :updated_at => Time.now
          )
      end
    end

    def self.nacl(length)
      x ||= [('a'..'z'),('A'..'Z'),('0'..'9')].map{|i| i.to_a}.flatten
      (0..(length-1)).map{ x[rand(x.length)] }.join
    end

    def self.login_allowed?(username,password)
      user = User.find_by_name(username)
      salt = user.salt
      salted_password = user.encrypted_password

      password_verifier = Digest::HMAC.new(salt,Digest::SHA1)
      resulting_password = password_verifier.hexdigest(password)

      if salted_password == resulting_password
        true
      else
        redirect to "/"
      end
    end

    def self.salt_the_password(password,salt)
      password_signer = Digest::HMAC.new(salt,Digest::SHA1)
      salted_password = password_signer.hexdigest(password)
    end

    def self.user_exist?(username)
      User.where("name" => username).count > 0
    end

  end
end
