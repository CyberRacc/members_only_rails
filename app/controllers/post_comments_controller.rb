class PostCommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @post = Post.find(params[:post_id])
    @comment = PostComment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.post_comments.build(comment_params)
    @comment.post = @post

    if @comment.save
      flash[:success] = "Comment created successfully!"
      redirect_to post_path(@post)
    else
      flash[:error] = "There was a problem creating your comment."
      redirect_to post_path(@post)
    end
  end

  private

  def comment_params
    params.require(:post_comment).permit(:comment)
  end
end
