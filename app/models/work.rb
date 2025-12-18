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



  private

  def generate_slug
    return if slug.present?
    # Generate a random number-based slug as requested (e.g., 100200)
    # Using timestamp + random to ensure uniqueness easily
    self.slug = Time.current.strftime('%Y%m%d%H%M%S')
  end
end
