class ApplicationController < ActionController::Base
  before_action :redirect_to_canonical_domain

  private

  def redirect_to_canonical_domain
    canonical_host = 't-rigger.net'
    if Rails.env.production? && request.host != canonical_host
      redirect_to "https://#{canonical_host}#{request.fullpath}", status: :moved_permanently, allow_other_host: true
    end
  end
end
