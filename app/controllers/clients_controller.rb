require 'prawn'

class ClientsController < ApplicationController

#  def index
#    render :text => 'ok', :layout => false
#  end

#  def show
#    render_to_string :nothing => true
#  end

#  def edit
#    @client = Client.find(params[:id])
#  end

#  def update
#    @client = Client.find(params[:id])

#    if @client.update_attributes(params[:client])
#      redirect_to(@client)
#    else
#      render :edit
#    end
#  end
  
  def download_pdf
    client = Client.find(1)
    send_data generate_pdf(client),
              :filename => "#{client.name}.pdf",
              :type => "application/pdf"
  end

  private
  def generate_pdf(client)
    Prawn::Document.new do 
      text client.name, :align => :center
      text "address: beijing"
    end.render
  end
end
