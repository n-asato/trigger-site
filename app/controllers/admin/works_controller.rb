class Admin::WorksController < Admin::BaseController
  before_action :set_work, only: [:show, :edit, :update, :destroy]

  def index
    @works = Work.order(created_at: :desc)
  end

  def show
  end

  def new
    @work = Work.new
    prepare_form_data
  end

  def edit
    prepare_form_data
  end

  def create
    @work = Work.new(work_params)
    merge_new_technologies
    prepare_form_data if @work.invalid?

    if @work.save
      redirect_to admin_work_path(@work), notice: "Work was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @work.assign_attributes(work_params)
    merge_new_technologies
    
    if @work.save
      redirect_to admin_work_path(@work), notice: "Work was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @work.destroy
    redirect_to admin_works_path, notice: "Work was successfully destroyed."
  end

  private

  def set_work
    @work = Work.find(params[:id])
  end

  def work_params
    params.require(:work).permit(
      :title, :description, :client_name, :year, :category,
      :external_link, :is_published, :published_at,
      :main_image, service_tags: [], technologies: [], gallery_images: []
    )
  end
  
  def merge_new_technologies
    new_techs = params[:work][:new_technologies]
    return if new_techs.blank?
    
    current_techs = @work.technologies || []
    added_techs = new_techs.split(/[,、\/]/).map(&:strip).reject(&:blank?)
    @work.technologies = (current_techs + added_techs).uniq
  end

  def prepare_form_data
    # Determine which column to use for distinct values. 
    @existing_technologies = Work.all.map(&:technologies).flatten.compact.uniq.sort
  end
end
