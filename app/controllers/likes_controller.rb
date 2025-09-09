class LikesController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :authenticate_user!
  before_action :set_blog_post

  def update
    if @blog_post.liked_by?(current_user)
      @blog_post.unlike(current_user)
    else
      @blog_post.like(current_user)
    end

    respond_to do |format|
      format.turbo_stream {
        render turbo_stream: turbo_stream.replace(dom_id(@blog_post, :likes), partial: "blog_posts/likes", locals: { post: @blog_post })
      }
    end
  end

  private

  def set_blog_post
    @blog_post = BlogPost.find(params[:blog_post_id])
  end
end
