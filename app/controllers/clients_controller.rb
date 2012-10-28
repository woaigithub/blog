class ClientsController < ApplicationController

  def index
    render :text => 'ok', :layout => false
  end

  def show
    render_to_string :nothing => true
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])

    if @client.update_attributes(params[:client])
      redirect_to(@client)
    else
      render :edit
    end
  end

end
