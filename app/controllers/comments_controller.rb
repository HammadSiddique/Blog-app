class CommentsController < ApplicationController

  load_and_authorize_resource

  def create
    @post = Post.includes(:user).find(params[:post_id])
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

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(@comment.post_id)
    @post.comments_counter -= 1
    @post.save
    @comment.destroy!
    flash[:success] = 'Comment deleted successfully!'
    redirect_to user_posts_path(current_user, params[:post_id])

  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
