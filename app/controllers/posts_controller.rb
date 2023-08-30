class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:comments).where(author_id: @user.id)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.includes(:comments).find_by(id: params[:id])
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
