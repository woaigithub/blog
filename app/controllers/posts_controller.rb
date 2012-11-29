class PostsController < ApplicationController
  def index
    @posts = Post.order("updated_at desc").all
  end

  def show
    @post = Post.find(params[:id])
  end


end
