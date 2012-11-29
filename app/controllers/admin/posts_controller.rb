class Admin::PostsController < ApplicationController
  layout "layouts/admin"

  def index
    @posts = Post.order("created_at desc").all
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def new 
    @post = Post.new
  end

  def create
    @category = Category.find(params[:post][:category_id])
    params[:post].delete(:category_id)
    @post = @category.posts.build(params[:post])
    if @post.save
      
      redirect_to admin_posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end 


  def update
    @category = Category.find(params[:post][:category_id])
    params[:post].delete(:category_id)
    @post = Post.find(params[:id])
    @post.category = @category
    if @post.update_attributes(params[:post])
      redirect_to admin_posts_path
    else
      render :edit
    end
  end
end
