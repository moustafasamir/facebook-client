class FacebookModelsController < ApplicationController
  def home
    @posts = session[:facebook].get_connections("me", "feed")
    render json: @posts
  end

  def show
    @object = session[:facebook].get_object(params[:id])
    render json: @object
  end
end
