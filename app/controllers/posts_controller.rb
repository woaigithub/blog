class PostsController < ApplicationController
#  http_basic_authenticate_with :name => "root", :password => "root", :except => [:index, :show]

  USERS ={"root" => "root"}
  before_filter :authenticate, :except => [:index, :show]
  
 

  # GET /posts
  # GET /posts.json
  def index
   # @posts = Post.all
    
    page = params[:page]
    if(page == nil)
      page = 1
    end    
    @posts = Post.paginate(:page => page, :per_page => 10, :order => "updated_at desc").includes(:category)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    @categories = Category.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @categories = Category.all
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    @categories = Category.all
    
    

    respond_to do |format|
      if @post.save
        uploaded_io = params[:post][:picture]
        if uploaded_io != nil and uploaded_io.content_type.match('image')
       
          File.open(Rails.root.join('public','uploads',uploaded_io.original_filename),'wb') do |f|

            f.write(uploaded_io.read)
          end
       
        else
          flash[:notice] = 'do not support non image format!'
        end
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    @categories = Category.all

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to posts_url, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
 
  private
  
  def authenticate
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end
    
end
