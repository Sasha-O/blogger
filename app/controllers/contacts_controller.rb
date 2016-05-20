class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request

    if @contact.deliver
      flash.now[:error] = nil
    else
      flash.now[:error] = "All fields must be completed."
      render 'new'
    end
  end
end