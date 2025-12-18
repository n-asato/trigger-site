class HomeController < ApplicationController
  def index
    @recent_works = Work.published.order(published_at: :desc).limit(12)
  end
end
