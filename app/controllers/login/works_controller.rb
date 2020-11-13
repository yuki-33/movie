class Login::WorksController < Login::ApplicationController
  before_action :set_work, only: [:edit, :update, :destroy]

  def new
    @work = Work.new
    @work.director_id = params[:director_id] if params[:director_id].present?
  end

  def create
    @work = Work.new(works_params)
    if !@work.image.attached? && @work.image_blob_id
        @work.image.attach(ActiveStorage::Blob.find(@work.image_blob_id))
    end
    if @work.save
      redirect_to works_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if !@work.image.attached? && @work.image_blob_id
        @work.image.attach(ActiveStorage::Blob.find(@work.image_blob_id))
    end
    if @work.update(works_params)
      @work.image.purge if params[:work][:remove_image_id]
      if params[:work][:remove_picture_ids]
        params[:work][:remove_picture_ids].each do |picture_id|
          picture = @work.pictures.find(picture_id)
          picture.purge
        end
      end
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
      tag_ids: [],
      pictures: []
    )
  end

end
