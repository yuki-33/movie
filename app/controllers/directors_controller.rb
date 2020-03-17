class DirectorsController < ApplicationController
  before_action :set_director, only: [:edit, :show, :update, :destroy]

  def index
    @directors = Director.all.by_id
  end

  def create
    @director = Director.new(directors_params)
    if @director.save
      redirect_to directors_path
    else
      render "new"
    end
  end

  def new
    @director = Director.new
  end

  def edit
  end

  def show
  end

  def update
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
    params[:director].permit(:name, :from)
  end

end
