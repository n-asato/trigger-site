# Set the host name for URL generation
SitemapGenerator::Sitemap.default_host = "https://t-rigger.net"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify them)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end

  add "/about", priority: 0.7, changefreq: 'monthly'
  add "/service", priority: 0.8, changefreq: 'monthly'
  
  # Service details
  ['education', 'improvement', 'maintenance', 'development', 'consulting'].each do |type|
    add "/services/#{type}", priority: 0.7, changefreq: 'monthly'
  end

  add "/works", priority: 0.8, changefreq: 'weekly'
  add "/contact", priority: 0.7, changefreq: 'monthly'
  
  # Published works
  Work.published.find_each do |work|
    add work_path(work), lastmod: work.updated_at, priority: 0.6, changefreq: 'monthly'
  end
end
