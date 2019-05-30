class CommentsController < ApplicationController

  def edit
  @post = Post.find(params[:post_id])
  @comment = @post.comments.find(params[:id])
  end

  def update
   @post = Post.find(params[:post_id])
   @comment = @post.comments.find(params[:id])
   @comment.update(comments_params)

   redirect_to post_path(@post)  
  end

  def create
   @post = Post.find(params[:post_id])
   @comment = @post.comments.build(comments_params)
    
   if @comment.save
      redirect_to post_path(@post)
   else
      render 'posts/show'
   end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comments_params
  params.require(:comment).permit(:content).merge(user: current_user)
  end

end
