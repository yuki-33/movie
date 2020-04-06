class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @works = @tag.works.includes(:director).by_position.page(params[:page]).per(6)
    render 'works/index'
  end
end
