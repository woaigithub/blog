class Admin::PostsController < ApplicationController
  layout "layouts/admin"

  def index
    @posts = Post.order("created_at desc").all
  end

  def show
    @post = Post.find(params[:id])
  end
end
