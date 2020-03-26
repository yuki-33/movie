class WorksController < ApplicationController
  before_action :set_work, only: [:show]

  def index
    @works = Work.includes(:director).by_position.page(params[:page]).per(2)
  end

  def show
  end

  def move_higher
    Work.find(params[:id]).move_higher
    redirect_to works_path
  end



  private
  def set_work
    @work = Work.find(params[:id])
  end


end
