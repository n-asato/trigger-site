module ApplicationHelper
  def default_meta_tags
    {
      site: 'TRiGGER | トリガー',
      reverse: true,
      separator: '|',
      description: '安里 直人による介護・福祉業界向けIT支援サービス TRiGGER',
      keywords: '介護, 福祉, IT支援, 業務改善, デジタル化, トリガー',
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      icon: [
        { href: '/assets/favicon_t.png', type: 'image/png' },
        { href: '/assets/favicon_t.png', rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png' },
      ],
      og: {
        site_name: 'TRiGGER | トリガー',
        title: 'TRiGGER | トリガー',
        description: '安里 直人による介護・福祉業界向けIT支援サービス TRiGGER',
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
