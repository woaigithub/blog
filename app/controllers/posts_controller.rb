class PostsController < ApplicationController
  def index
    @posts = Post.includes(:category).order("updated_at desc").all

    @categories = Category.all
  end

  def show
    @post = Post.find(params[:id])

    @categories = Category.all
    
  end


end
