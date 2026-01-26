class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      SendgridMailer.send_contact_email(@contact)
      SendgridMailer.send_auto_reply(@contact)
      redirect_to thanks_contacts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def thanks
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :company_name, :email, :subject, :message, :website)
  end
end
