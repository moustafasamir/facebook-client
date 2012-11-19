class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :last_name, :username

  has_many :lists
  has_many :authentications

  class << self
  	def find_or_create_by_omniauth(omniauth)
  	  authentication = Authentication.find_by_uid_and_provider(omniauth['uid'], omniauth['provider'])	
      puts "kaka di walla eh ?"
      puts authentication.inspect
      puts omniauth.inspect
  	  if authentication.present?
        user = authentication.user
  	  	user.update_by_omniauth(omniauth)
  	  	return user
  	  else
  	  	user = User.create({:email => omniauth['info']['email'], :password => "111111", :password_confirmation => "111111" })
        puts user.inspect
  	  	if user.save
          user.update_by_omniauth(omniauth)
  	  	  user.authentications.create(:uid => omniauth['uid'], :provider => omniauth['provider'], :token=> omniauth['token'])
        else
          puts user.errors.inspect
          return nil
        end
  	  	return user
  	  end
  	end
  end
  def update_by_omniauth(omniauth)
    self.name = omniauth['name'] if omniauth['name'].present?
    self.avatar_url = omniauth['image'] if omniauth['image'].present?
    self.terms = omniauth['terms'] if omniauth['terms'].present?
    self.email = omniauth['email'] if omniauth['email'].present?
  end
end