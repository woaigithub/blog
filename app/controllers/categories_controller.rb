class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @posts = @category.posts.paginate(:page => params[:page],:per_page => 10)
    @categories = Category.all
    render "posts/index"
  end
end
