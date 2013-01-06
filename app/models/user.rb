# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string(255)
#  last_name              :string(255)
#  username               :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#

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
  has_many :favorite_posts, class_name: 'Post', conditions: {post_type: 'favorite'}
  has_many :later_posts, class_name: 'Post', conditions: {post_type: 'later'}

  after_create :create_home_list
  # after_create :create_facebook_lists

  class << self
  	def find_or_create_by_omniauth(omniauth)
  	  authentication = Authentication.find_by_uid_and_provider(omniauth['uid'], omniauth['provider'])	
  	  if authentication.present?
        user = authentication.user
        authentication.token = omniauth['credentials']['token']
        authentication.save
  	  	user.update_by_omniauth(omniauth)
  	  	return user
  	  else
  	  	user = User.create({:email => omniauth['info']['email'], :password => "111111", :password_confirmation => "111111" })
  	  	if user.save
          user.update_by_omniauth(omniauth)
  	  	  user.authentications.create(:uid => omniauth['uid'], :provider => omniauth['provider'], :token=> omniauth['credentials']['token'])
        else
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
  def create_home_list
    self.lists.create(:name => "Home", :user_id => self.id)
  end
  def create_facebook_lists
    token = self.authentications.where(provider: "facebook").first.token
    facebook = Koala::Facebook::API.new(token)
    
    lists = Hash.new { |hash, key| hash[key] = {:pages=>[], :name=>key}}
    facebook.get_connections("me", "likes").each{|page|lists[page["category"]][:pages] << page}
    #the following line isn't tested as this function isn't needed for now
    lists.values.each{|list| self.lists.create(list)}
  end
end
