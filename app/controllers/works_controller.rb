class WorksController < ApplicationController
  before_action :set_work, only: [:show]

  def index
    @q = Work.includes(:director).ransack(params[:q])
    @works = @q.result(distinct: true).by_position.page(params[:page]).per(6)
    @tags = Tag.all
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
