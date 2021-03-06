class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create new]
  def index
    @list = User.joins(:posts).select('posts.title, Posts.content,users.email')
  end

  def new
    @post = Post.new
    @user_id = current_user.id
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :title)
  end
end
