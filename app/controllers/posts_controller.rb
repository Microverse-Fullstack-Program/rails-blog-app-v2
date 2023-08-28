class PostsController < ApplicationController
  def index
    @current_user = current_user
    @user = User.find(params[:user_id])

    redirect_to root_path if @user.nil?
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])

    redirect_to root_path if @user.nil?
    @post = @user.posts.find(params[:id])

    redirect_to user_posts_path(@user) if @post.nil?
    @comments = @post.comments
  end

  def new
    @user = User.find(params[:user_id])

    redirect_to root_path if @user.nil?
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    if @post.save
      redirect_to user_path(current_user.id), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
