class PostsController < ApplicationController
  def index
    @posts = Post.includes(:category)
                 .order("updated_at desc")
                 .paginate(:page => params[:page],:per_page => 10)

    @categories = Category.all
  end

  def show
    @post = Post.find(params[:id])

    @categories = Category.all
    
  end


end
