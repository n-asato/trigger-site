module ApplicationHelper
  def default_meta_tags
    {
      site: 'TRiGGER | トリガー',
      reverse: true,
      separator: '|',
      description: '愛知県名古屋市名東区を拠点に、介護・福祉業界のデジタル化を推進するIT支援サービスTRiGGER。システムエンジニア経験を活かしたITコンサルタントとして、業務改善やPC環境整備、ホームページ制作、Web制作など、現場の"やりたい事"をITで実現します。',
      keywords: '愛知県, 名古屋市, 名東区, 介護, 福祉, IT支援, ITコンサルタント, システムエンジニア, 業務改善, デジタル化, ホームページ制作, トリガー, TRiGGER',
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      icon: [
        { href: image_path('favicon_t.png'), type: 'image/png' },
        { href: image_path('favicon_t.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png' },
      ],
      og: {
        site_name: 'TRiGGER | トリガー',
        title: 'TRiGGER | トリガー',
        description: '愛知県名古屋市名東区を拠点に、介護・福祉業界のデジタル化を推進するIT支援サービスTRiGGER。システムエンジニア経験を活かしたITコンサルタントとして、ホームページ制作や業務改善をサポートします。',
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
