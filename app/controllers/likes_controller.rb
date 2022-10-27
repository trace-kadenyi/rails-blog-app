class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.new(like_params)
    @user = current_user
    @like.users = @user

    @like.save unless @like.invalid?
    redirect_to user_posts_path(@user)
  end

  def like_params
    params.require(:like).permit(:post_id)
  end
end