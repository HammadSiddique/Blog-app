class LikesController < ApplicationController
  def create
    @post = Post.includes(:user).find(params[:post_id])
    @like = Like.create
    @like.user = current_user
    @like.post = @post
    if @like.save
      flash[:success] = 'Like added successfully!'
      redirect_to user_posts_path(current_user, @post)
    else
      flash.now[:error] = 'Something unexpected happened, like could not be added.'
    end
  end
end
