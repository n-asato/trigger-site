class ServicesController < ApplicationController
  SERVICES = {
    'education' => {
      title: '整えます',
      english: 'SETUP',
      description: 'PCを始めとしたIT機器の選定とそれを使用するWi-Fi環境等、働く環境を整えます。',
      icon: 'icon_education.png'
    },
    'improvement' => {
      title: '改善します',
      english: 'IMPROVEMENT',
      description: 'プログラミングやAIを活用した効率化を提案・実装し、生産性向上に寄与します。',
      icon: 'icon_improvement.png'
    },
    'maintenance' => {
      title: '代わります',
      english: 'REPRESENT',
      description: '貴社のIT担当として、社内・社外のあらゆるやり取りの取仕切りを行います。',
      icon: 'icon_maintenance.png'
    },
    'development' => {
      title: '作ります',
      english: 'DEVELOPMENT',
      description: 'ホームページやWebアプリケーション等の制作を行います。',
      icon: 'icon_development.png'
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

    # Query works where service_tags JSON array contains the service_type
    @works = Work.published.where("service_tags::text LIKE ?", "%#{@service_type}%").order(year: :desc)
  end
end
