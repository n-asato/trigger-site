class ServicesController < ApplicationController
  SERVICES = {
    'education' => {
      title: '教えます',
      english: 'EDUCATION',
      description: '大人・子どもを問わず、一人ひとりに寄り添ったオーダーメイド型のプログラミング教育を提供しています。',
      icon: 'icon_education.png'
    },
    'development' => {
      title: '作ります',
      english: 'DEVELOPMENT',
      description: 'ホームページやWebアプリケーション等の制作を行います。',
      icon: 'icon_development.png'
    },
    'maintenance' => {
      title: '守ります',
      english: 'MAINTENANCE',
      description: 'システムの保守、メンテナンス、アップデート対応を行います。',
      icon: 'icon_maintenance.png'
    },
    'improvement' => {
      title: '改善します',
      english: 'IMPROVEMENT',
      description: 'プログラミングやAIを活用した効率化を提案・実装し、生産性向上に寄与します。',
      icon: 'icon_improvement.png'
    },
    'consulting' => {
      title: '相談乗ります',
      english: 'CONSULTING',
      description: '「何から始めればいいか分からない」「やりたいことをどう実現すればいい？」といったお悩みについて、気軽にご相談いただけます。',
      icon: 'icon_consulting.png'
    }
  }.freeze

  def index
  end

  def show
    @service_type = params[:service_type]
    @service = SERVICES[@service_type]
    
    unless @service
      redirect_to service_path, alert: 'サービスが見つかりません'
      return
    end

    @works = Work.published.where("service_tags LIKE ?", "%#{@service_type}%").order(year: :desc)
  end
end
