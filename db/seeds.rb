# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Work.create!([
  {
    slug: 'portfolio-site',
    title: 'My Portfolio Site',
    description: 'This is my personal portfolio site built with Rails.',
    client_name: 'Self',
    year: 2025,
    category: 'Web Website',
    tags: ['Rails', 'Turbo', 'Tailwind'],
    roles: ['Design', 'Coding'],
    technologies: 'Ruby on Rails 7, TailwindCSS, Hotwire',
    is_published: true,
    published_at: Time.current
  },
  {
    slug: 'corporate-redesign',
    title: 'Corporate C Redesign',
    description: 'Redesign of a corporate website.',
    client_name: 'Corporate C',
    year: 2024,
    category: 'Web Website',
    tags: ['Next.js', 'React'],
    roles: ['Direction', 'Design'],
    technologies: 'Next.js, Figma',
    is_published: true,
    published_at: 1.month.ago
  }
])
puts "Seeding completed."
