class AuthenticationController < ApplicationController
  def callback
  	omniauth = request.env["omniauth.auth"]
  	user = User.find_or_create_by_omniauth(omniauth)
  	sign_in :user, user unless user.blank?
  	redirect_to root_path
  end
end
