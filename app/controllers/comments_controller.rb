class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.create(comment_params)
    @comment.user = current_user
    @comment.post = @post
    if @comment.save
      flash[:success] = 'Comment created successfully!'
      redirect_to user_posts_path(current_user, @post)
    else
      flash.now[:error] = 'Something unexpected happened, comment could not be created.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
