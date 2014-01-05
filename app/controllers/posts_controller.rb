class PostsController < ApplicationController
  before_action :admin_user, only: [:edit, :update, :destroy, :new, :create, :update]
  before_action :correct_user,   only: :destroy
    
  def index
  @posts = Post.all
  @posts = Post.paginate(page: params[:page], :per_page => 5)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @comment = @post.comments
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
  end

  def recent
    @post = Post.find(params[:id])
    @posts = Post.includes(:comments).order("created_at desc").limit(3)
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated"
      redirect_to @post
    else
      render 'edit'
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(post_params[:id]).destroy
    flash[:success] = "Post deleted."
    redirect_to 'index'
  end
  
  private

    def post_params
      params.require(:post).permit(:content, :title, :image_url)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end

end
