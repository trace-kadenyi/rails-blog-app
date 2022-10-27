class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @user = current_user
    @comment.users = @user

    @comment.save unless @comment.invalid?
    redirect_to user_posts_path(@user)
  end

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
