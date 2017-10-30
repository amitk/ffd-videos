class ContentsController < ApplicationController

  def index
    @contents = Content.all
  end

  def new
    @content = Content.new
  end

  def show
  end

  def create
    Content.create(content_params)
  end

  def content_params
    params.require(:content).permit(:name, :category, :url, :view_limit, :view_span, :file)
  end

end
