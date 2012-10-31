class Admin::PostsController < Admin::ApplicationController

  def index
    page = params[:page]
    if page == nil
      page = 1
    end

    @posts=Post.paginate(:page => page, :per_page => 10)
   
    respond_to do |format|
      format.html
      format.json { render :json => @posts }
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
