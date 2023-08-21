class PostsController < ApplicationController
  def index
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
end
