class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create(author_id: current_user.id)
    @like.save

    redirect_to user_post_path(@post.author_id, @post.id)
  end
end
