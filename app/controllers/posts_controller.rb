class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :is_user?, except: [:index, :show, :new, :create]
  before_action :set_post, only: [:edit, :show, :update, :destroy]

  def index
    @posts = Post.all.order(id: :desc)
  end

  def show
  @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    
    if @post.save
      flash[:success] = "El artículo se creo"
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "El artículo fue editado correctamente"
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "El post se eliminó correctamente"
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def is_user?
    @post = Post.find(params[:id])
    unless current_user.id == @post.user_id
      flash[:alert] = "Ojo! No tienes permisos para hacer eso"
      redirect_to posts_path
    end
  end

  def post_params
    params.require(:post).permit(:title, :content, :category_id, :user_id)
  end
end
