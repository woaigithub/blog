class TagsController < ApplicationController

  def index
    @tags = Tag.all

    respond_to do |format|
      format.html #index.html.erb
      format.json { render json: @tags }
    end
  end

  def show
    @tag = Tag.find(params[:id])

    respond_to do |format|
      format.html #show.html.erb
      format.json { render json: @tag }
    end
  end

  def new
    @tag = Tag.new

    respond_to do |format|
      format.html #new.html.erb
      format.json { render json: @tag }
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def create
    @tag = Tag.new(params[:tag])
  
    respond_to do |format|
      if @tag.save
        format.html { redirect_to tags_url, notice: 'tag was successfully created.' }
        format.json { render json: @tag, status: :created, location: @tag }
      else
        format.html { render action: "new" }
        format.html { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @tag = Tag.new(params[:id])
 
    respond_to do |format|
      if @tag.update_attributes(params[:tag])
        format.html { redirect_to tags_url, notice: 'tag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { ender json: @tag.errors, status: :unprocessable_entity }
      end
    end 
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to tags_url }
      format.json { head :no_content }
    end
  end
end

