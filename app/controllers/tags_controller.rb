class TagsController < ApplicationController
  def show
    @tags = Tag.all
    @tag = Tag.find(params[:id])
    @q = @tag.works.includes(:director).ransack(params[:q])
    @works = @q.result(distinct: true).by_position.page(params[:page]).per(6)
    render 'works/index'
  end
end
