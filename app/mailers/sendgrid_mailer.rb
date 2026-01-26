require 'sendgrid-ruby'
include SendGrid

class SendgridMailer
  def self.send_contact_email(contact)
    from = SendGrid::Email.new(email: 'asato@t-rigger.net', name: 'TRiGGER')
    to = SendGrid::Email.new(email: 'info@t-rigger.net')
    subject = "【TRiGGER】お問い合わせ: #{contact.subject}"
    
    content_text = <<~BODY
      以下の内容でお問い合わせがありました。

      ■会社名
      #{contact.company_name}

      ■担当者名
      #{contact.name}

      ■メールアドレス
      #{contact.email}

      ■件名
      #{contact.subject}

      ■ご相談内容
      #{contact.message}
    BODY

    content = SendGrid::Content.new(type: 'text/plain', value: content_text)
    mail = SendGrid::Mail.new(from, subject, to, content)
    
    # Add reply-to header
    mail.reply_to = SendGrid::Email.new(email: contact.email, name: contact.name)
    
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    
    Rails.logger.info "SendGrid response: #{response.status_code}"
    response
  end
end
