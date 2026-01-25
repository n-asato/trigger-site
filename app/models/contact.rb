class Contact
  include ActiveModel::Model

  attr_accessor :name, :company_name, :email, :subject, :message, :website

  # Basic validations
  validates :name, presence: true, length: { maximum: 100 }
  validates :company_name, length: { maximum: 100 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :subject, presence: true, length: { maximum: 200 }
  validates :message, presence: true, length: { maximum: 5000 }

  # Honeypot field - if filled, it's a bot
  validates :website, absence: true

  # Security: Prevent email header injection
  validate :no_header_injection

  private

  def no_header_injection
    dangerous_patterns = /[\r\n]|%0[aAdD]/i
    [:name, :company_name, :email, :subject].each do |field|
      if send(field).to_s.match?(dangerous_patterns)
        errors.add(field, 'contains invalid characters')
      end
    end
  end
end
