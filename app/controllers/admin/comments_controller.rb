class Admin::CommentsController < Admin::ApplicationController

  def index
    page = params[:page]
    if page == nil 
      page = 1
    end
    @comments = Comment.paginate(:page => page, :per_page => 10, :order => 'updated_at desc').includes(:post)
    respond_to do |format|
      format.html
      
    end
  end


  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  
    respond_to do |format|
      format.html { redirect_to admin_comments_path }
    end
  end
end
