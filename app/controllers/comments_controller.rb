class CommentsController < ApplicationController

  def create
   @post = Post.find(params[:post_id])
   @comment = @post.comments.create(comments_params)
  #  @comment = @post.comments.create(comment_params)
    # bye_bug
   redirect_to post_path(@post)
  end

  private

  def comments_params
  params.require(:comment).permit(:content).merge(user: current_user)
  end

end
