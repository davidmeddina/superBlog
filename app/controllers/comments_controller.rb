# frozen_string_literal: true

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

    #  if @comment.save
    #     redirect_to post_path(@post)
    #  else
    #     render 'posts/show'
    #  end
    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post) }
        format.js # renders create.js.erb
      else
        format.html { redirect_to post_path(@post), notice: 'Relply did not save. Please try again.' }
        format.js
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.js
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:content).merge(user: current_user)
  end
end
