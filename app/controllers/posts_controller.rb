class PostsController < ApplicationController
  # rescue_from Pundit::NotAuthorizedError, :with => :record_not_found
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :auth_post, only: [:update, :destroy, :publish]
  before_filter :authenticate_user!, except: [:index, :show]
  # GET /posts
  # GET /posts.json
  #
  
  layout :resolve_layout

  def new
    @post = Post.new
  end

  def index
    @posts = policy_scope(Post.scoped) 
  end

  def show
    @post = Post.find(params[:id])
    @commentable = @post
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    authorize @post
    @post.comments.build
    respond_to do |format|
      if @post.save
        current_user.posts << @post 
        format.html { redirect_to(  { action: "show", id: @post.id }, notice: 'Post was successfully created.' )    }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def publish
    set_post
    authorize @post, :update?
    @post.published = true
    @post.save
    redirect_to post_url( @post )
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
    auth_post
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
    safe_attributes = [
      commentable_attributes: [ 
        :id, :commentable_id, :commentable_type, :author, :comment
      ]
    ]
    params.require(:post).permit(:title, :description, :content, :author_id,  (:published if current_user.role == 'editor'), *safe_attributes)
  end

  def auth_post
    set_post
    authorize @post
  end

  def  resolve_layout
    if  action_name == 'index'
      'blog-index'
    elsif action_name == 'show'
      'blog-show'
    else
      "portfolio"
    end
  end

end

