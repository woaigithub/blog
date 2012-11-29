class Admin::CategoriesController < Admin::ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])

    if @category.save
      flash[:notice] = "category was created successfully"
      redirect_to admin_categories_path
    else
      flash.now[:notice] = "create category failed"
      render :new
    end

  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(params[:category])
      flash[:notice] = "category was updated  successfully"
      redirect_to admin_categories_path
    else
      flash.now[:notice] = "update category failed"
      render :edit
    end
  end
end
