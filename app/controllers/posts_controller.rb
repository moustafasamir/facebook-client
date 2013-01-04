class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    # @posts = Post.all
    @posts = session[:facebook].get_connections("me", "feed")
    # session[:posts] = @posts[0..0]
    # @posts = session[:posts]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end
  
  def later
    @posts = current_user.later_posts
    respond_with @posts
  end

  def favorite
    @posts = current_user.favorite_posts
    respond_with @posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  def fetch_by_fb_id
    @post = session[:facebook].get_object()
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.find_by_post_type_and_user_id_and_fb_id(params[:post][:post_type], current_user.id, params[:post][:fb_id])
    if @post.blank?
      @post = Post.new(params[:post])
      @post.user = current_user
    end

    respond_to do |format|
      if @post.persisted? || @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
