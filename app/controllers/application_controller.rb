class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def sign_in(*args)
  	super(*args)
  	token = current_user.authentications.where(provider: "facebook").first.token
  	facebook = Koala::Facebook::API.new(token)
  	session[:facebook] = facebook
  end
end
