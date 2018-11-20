class PostsController < ApplicationController
  
  def new 
    @post = Post.new
  end 
  
  def edit
    if current_user.posts.find(params[:id])
      @post = Post.find(params[:id])
      render :edit
    else
      flash.now[:errors] = ['You do not own this post']
      render :show
    end
  end 
  
  def create 
    @post = Post.new(post_params)
    @post.author_id = current_user.id 
    @post.sub_id = params[:sub_id]
    if @post.save 
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end 
  
  def show 
    @post = Post.find(params[:id])
  end 
  
  def update 
    @post = current_user.posts.find(params[:id])
    if @post.update_attributes(post_params) 
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end 
  
  def destroy 
    
  end 
  
  private 
  
  def post_params
    params.require(:post).permit(:title, :url, :content)
  end 
  
  
end
