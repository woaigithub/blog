class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @posts = @category.posts
    @categories = Category.all
    render "posts/index"
  end
end
