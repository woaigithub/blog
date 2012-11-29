class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @posts = @category.posts
    render "posts/index"
  end
end
