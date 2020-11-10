class Login::DirectorsController < Login::ApplicationController
  before_action :set_director, only: [:edit, :update, :destroy]

  def new
    @director = Director.new
  end

  def create
    @director = Director.new(directors_params)
    @director.photo.attach(ActiveStorage::Blob.find(@director.photo_blob_id)) if !@director.photo.attached? && @director.photo_blob_id
    if @director.save
      redirect_to directors_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @director.photo.attach(ActiveStorage::Blob.find(@director.photo_blob_id)) if !@director.photo.attached? && @director.photo_blob_id
    @director.photo.purge if params[:director][:remove_photo_id]
    if @director.update(directors_params)
      redirect_to director_path(@director)
    else
      render "edit"
    end
  end

  def destroy
    @director.destroy
    redirect_to directors_path
  end


  private
  def set_director
    @director = Director.find(params[:id])
  end

  def directors_params
    params[:director].permit(:name, :from, :photo, images: [])
  end

end
