class WorksController < ApplicationController
  def index
    @works = Work.published.order(published_at: :desc)
  end

  def show
    @work = Work.published.find_by!(slug: params[:slug])
  rescue ActiveRecord::RecordNotFound
    redirect_to works_path
  end
end
