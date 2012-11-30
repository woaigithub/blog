class Admin::TagsController < Admin::ApplicationController

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(params[:tag])

    if @tag.save
      flash[:notice] = "tag was created successfully"
      redirect_to admin_tags_path
    else
      flash.now[:notice] = "create tag failed"
      render :new
    end

  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])

    if @tag.update_attributes(params[:tag])
      flash[:notice] = "tag was updated  successfully"
      redirect_to admin_tags_path
    else
      flash.now[:notice] = "update tag failed"
      render :edit
    end
  end
end