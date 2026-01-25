class ContactMailer < ApplicationMailer
  default from: 'noreply@t-rigger.net'
  default to: 'info@t-rigger.net'

  def send_email(contact)
    @contact = contact
    mail(subject: "【TRiGGER】お問い合わせ: #{contact.subject}")
  end
end
