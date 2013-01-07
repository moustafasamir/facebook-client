class FacebookModelsController < ApplicationController
  def home
    # @posts = session[:facebook].get_connections("mohamed.mahmoud59", "feed")
    @posts = session[:facebook].get_connections("me", "home?sk=h_chr")
    # puts @posts.inspect
    postsIds = ""
    postsIds = @posts.map{ |post| "'#{post["id"]}'"}.join(",")
    # likes = session[:facebook].fql_query("SELECT post_id FROM like WHERE post_id IN (#{postsIds}) AND user_id=me()")
    likes = []
    @posts.each do |post|
      post["liked"] = likes.map(&:values).flatten.include? post["id"]
    end
    render json: @posts
  end

  def show
    @object = session[:facebook].get_object(params[:id])
    render json: @object
  end

  def like
    success = session[:facebook].put_like(params[:id])
    response = {:success => success}
    render json: response
  end
  
  def unlike
    success = session[:facebook].delete_like(params[:id])
    response = {:success => success}
    render json: response
  end

  def share
    puts params[:post]
    session[:facebook].put_connections("me", "feed", params[:post])
    render json: {success: true}
  end
end
