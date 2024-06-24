class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = "Post created successfully!"
      redirect_to root_path
    else
      flash[:error] = "There was a problem creating your post."
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
