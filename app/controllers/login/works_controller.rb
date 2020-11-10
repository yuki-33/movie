class Login::WorksController < Login::ApplicationController
  before_action :set_work, only: [:edit, :update, :destroy]

  def new
    @work = Work.new
    @work.director_id = params[:director_id] if params[:director_id].present?
  end

  def create
    @work = Work.new(works_params)
    @work.image.attach(ActiveStorage::Blob.find(@work.image_blob_id)) if !@work.image.attached? && @work.image_blob_id
    if @work.save
      redirect_to works_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @work.image.attach(ActiveStorage::Blob.find(@work.image_blob_id)) if !@work.image.attached? && @work.image_blob_id
    @work.image.purge if params[:work][:remove_image_id]
    if @work.update(works_params)
      redirect_to work_path(@work)
    else
      render "edit"
    end
  end

  def destroy
    @work.destroy
    redirect_to works_path
  end



  private
  def set_work
    @work = Work.find(params[:id])
  end

  def works_params
    params[:work].permit(
      :title,
      :director_id,
      :release,
      :starring,
      :description,
      :image,
      tag_ids: []
    )
  end

end
