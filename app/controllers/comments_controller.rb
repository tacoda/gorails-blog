class CommentsController < ApplicationController
  before_action :authenticate_user!

  # TODO: Create another case for comments on comments
  def create
    @comment = @commentable.comments.new comment_params
    @comment.user_id = current_user
    @comment.save
    redirect_to @commentable, notice: "Your comment was succesfully posted."
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
