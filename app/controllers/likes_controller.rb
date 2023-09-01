class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @post = Post.find(params[:post_id])
    if Like.where(author_id: current_user.id, post_id: @post.id).exists?
      @like = Like.find_by(author_id: current_user.id, post_id: @post.id)
      @like.destroy
    else
      @like = @post.likes.create(author_id: current_user.id)
      @like.save
    end

    redirect_to request.referrer
  end
end
