class DirectorsController < ApplicationController
  before_action :set_director, only: [:show]

  def index
    @directors = Director.all.by_id
  end

  def show
  end


  private
  def set_director
    @director = Director.find(params[:id])
  end

end
