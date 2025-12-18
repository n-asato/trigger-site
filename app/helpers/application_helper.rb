module ApplicationHelper
  def default_meta_tags
    {
      site: 'KATELIER | カトリエ',
      reverse: true,
      separator: '|',
      description: 'Portfolio of Yoshiro Kato, a Web Director and Designer based in Tokyo.',
      keywords: 'web design, direction, coding, portfolio, tokyo',
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      icon: [
        { href: '/assets/favicon_k.png', type: 'image/png' },
        { href: '/assets/favicon_k.png', rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png' },
      ],
      og: {
        site_name: 'KATELIER | カトリエ',
        title: 'KATELIER | カトリエ',
        description: 'Portfolio of Yoshiro Kato, a Web Director and Designer based in Tokyo.',
        type: 'website',
        url: request.original_url,
        image: '/apple-touch-icon.png',
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@yoshirokato',
      }
    }
  end
end
