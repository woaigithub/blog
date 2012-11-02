class Admin::PostsController < Admin::ApplicationController


  def index
    page = params[:page]
    if page == nil
      page = 1
    end

    @posts=Post.paginate(:page => page, :per_page => 10, :order => 'updated_at desc').includes(:category)
   
    respond_to do |format|
      format.html
      format.json { render :json => @posts }
    end
  end

  def new
    @post = Post.new
    @categories = Category.all
    respond_to do |format|
      format.html
      format.json { render :json => @posts }
    end 
  end

  def create
    @post = Post.new(params[:post])
    @categories = Category.all

    respond_to do |format|
      if @post.save
        upload_io = params[:post][:picture]
        if upload_io !=nil and upload_io.content_type.match('image')
          File.open(Rails.root.join('public','uploads',upload_io.original_filename),'wb') do |file|
            file.write(upload_io.read)
          end
        end
        
        format.html { redirect_to admin_posts_path, :notice => 'Post was created successfully!' }
      else
        format.html { render :action => :new }
      end
    end
    
  end

  def edit
    @post = Post.find(params[:id])
    @categories = Category.all

  end
 
  def update
    @post = Post.find(params[:id])
    @categories = Category.all

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to admin_posts_path, :notice => 'Post was updated successfully!' }
      else
        format.html { render :action => :edit }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy

    respond_to do |format|
      format.html { redirect_to admin_posts_path }
      format.json { head :no_content }
    end
  end
end
