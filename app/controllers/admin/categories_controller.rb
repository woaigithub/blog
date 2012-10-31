class Admin::CategoriesController < Admin::ApplicationController

  def index
    page = params[:page]
    if page == nil
      page = 1
    end
    @categories = Category.paginate(:page => page, :per_page => 10)

    respond_to do |format|
      format.html
      format.json { render :json => @categories }
    end
  end
  
  def new
    @category = Category.new
    
    respond_to do |format|
      format.html
      format.json { render :json => @category }
    end
  end

  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_categories_path, :notice => 'category was successfully created!' }
        format.json { render :json => @category, :status => :created, :location => @category }
      else
        format.html { render :action => :new }
        format.json { render :json => @category.errors, :status => :unprocessable_entity }
      end
    end

  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to admin_categories_url, :notice => 'category was successfully updated!' }
        format.json { head :no_content }
      else 
        format.html { render :ation => :edit }
        format.json { render :json => @category.errors, :status => :unprocessable_entity }
      end
    end   
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    
    respond_to do |format|
      format.html { redirect_to admin_categories_url }
      format.josn { head :no_content }
    end
  end
  
end
