class Work < ApplicationRecord
  before_validation :generate_slug, on: :create
  has_one_attached :main_image
  has_many_attached :gallery_images

  serialize :service_tags, coder: JSON
  attribute :service_tags, :json, default: []
  
  serialize :technologies, coder: JSON
  attribute :technologies, :json, default: []
  
  attr_accessor :new_technologies



  VALID_SERVICE_TAGS = %w[education development maintenance improvement consulting].freeze

  validates :slug, presence: true, uniqueness: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :year, presence: true

  validates :description, presence: true

  scope :published, -> { where(is_published: true) }

  # Validate image file types
  validate :validate_main_image_content_type
  validate :validate_gallery_images_content_type

  private

  ALLOWED_IMAGE_TYPES = ['image/png', 'image/jpeg', 'image/gif', 'image/webp'].freeze

  def validate_main_image_content_type
    return unless main_image.attached?
    unless ALLOWED_IMAGE_TYPES.include?(main_image.content_type)
      errors.add(:main_image, 'must be a valid image format (PNG, JPEG, GIF, or WebP)')
    end
  end

  def validate_gallery_images_content_type
    return unless gallery_images.attached?
    gallery_images.each do |image|
      unless ALLOWED_IMAGE_TYPES.include?(image.content_type)
        errors.add(:gallery_images, 'must all be valid image formats (PNG, JPEG, GIF, or WebP)')
        break
      end
    end
  end

  def generate_slug
    return if slug.present?
    # Generate a random number-based slug as requested (e.g., 100200)
    # Using timestamp + random to ensure uniqueness easily
    self.slug = Time.current.strftime('%Y%m%d%H%M%S')
  end
end
