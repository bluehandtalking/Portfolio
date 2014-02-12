class PostsController < ApplicationController
  # rescue_from Pundit::NotAuthorizedError, :with => :record_not_found
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :auth_post, only: [:update, :destroy]
  before_filter :authenticate_user!, except: [:index]
  # GET /posts
  # GET /posts.json

  def new
    @post = Post.new
  end

  def index
    @posts = policy_scope(Post.scoped) 
  end

  def show
    @comment = Comment.new   # @post.comments.build
    @comments = @post.comments
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @post = Post.new(post_params)
    authorize @post
    @post.comments.build
    respond_to do |format|
      if @post.save
        current_user.posts << @post 
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def publish
    @post = Post.find(params[:id])
    authorize @post, :update?
    @post.publish!
    redirect_to @post
  end

  # PATCH/PUT /posts/1
  def update
    authorize @post
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @post
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :description, :content, :author_id,  (:published if current_user.role == 'editor') )
  end

  def auth_post
    authorize @post
  end

end
