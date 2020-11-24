class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def inquiry
    @contact = Contact.new(contact_params)
    if @contact.valid?
      UserNotifierMailer.send_when_submit(@contact).deliver
      redirect_to root_path, notice: 'Sent. Thank you'
    else
      render 'new'
    end
  end

  private

  def contact_params
    params[:contact].permit(
      :name,
      :email,
      :text
    )
  end

end
