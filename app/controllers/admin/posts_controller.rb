class Admin::PostsController < Admin::ApplicationController

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
    @post.user = current_user
    if @post.save
      flash[:notice] = "post was created successfully"
      redirect_to admin_posts_path
    else
      flash.now[:notice] = "create post failed"
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
    @post.user = current_user
    if @post.update_attributes(params[:post])
      flash[:notice] = "post was updated successfully"
      redirect_to admin_posts_path
    else
      flash[:notice] = "update post failed"
      render :edit
    end
  end
end
