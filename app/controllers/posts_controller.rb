class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user = current_user
    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post created successfully!'
          redirect_to user_posts_path(current_user, @post)
        else
          flash.now[:error] = 'Something unexpected happened, post could not be created.'
          render :new
        end
      end
    end
  end

  def destroy
    @post = Post.includes(:user).find(params[:id])
    @user = User.find(@post.user_id)
    @user.posts_counter -= 1
    @user.save
    @post.destroy!
    flash[:success] = 'Post deleted successfully!'
    redirect_to user_posts_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
