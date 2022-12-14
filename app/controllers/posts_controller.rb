class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
 
  def index
    @posts = Post.all
  end
 
  def show
   @post = Post.find(params[:id])
  end
 
  def new
    @post = Post.new
  end
 
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end
 
  def edit
  end
 
  def update

    if @post.update_attributes(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end


     def destroy
     @post =Post.find(params[:id])
     @post.destroy
     redirect_to root_path        

      end
 
  private
 
  def post_params
    params.require(:post).permit(:title, :body, {images: []})
  end
 
  def set_post
    @post = Post.find(params[:id])
  end
end