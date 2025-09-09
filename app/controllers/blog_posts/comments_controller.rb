class BlogPosts::CommentsController < CommentsController
  before_action :set_commentable

  private
  def set_commentable
    @commentable = BlogPost.find(params[:blog_post_id])
  end
end
