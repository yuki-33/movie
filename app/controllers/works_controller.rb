class WorksController < ApplicationController
  before_action :set_work, only: [:edit, :show, :update, :destroy]

  def index
    @works = Work.all.by_position
  end

  def create
    @work = Work.new(works_params)
    if @work.save
      redirect_to works_path
    else
      render "new"
    end
  end

  def new
    @work = Work.new
    @work.director_id = params[:director_id] if params[:director_id].present?
  end

  def edit
  end

  def show
  end

  def update
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

  def move_higher
    Work.find(params[:id]).move_higher
    redirect_to works_path
  end


  private
  def set_work
    @work = Work.find(params[:id])
  end

  def works_params
    params[:work].permit(:title, :director_id, :release, :starring, :description, :image)
  end

end
