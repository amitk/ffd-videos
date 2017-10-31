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
    content = Content.new(content_params)
    if content.valid?
      content.save
    else
      p content.errors
    end
  end

  def content_params
    params.require(:content).permit(:name, :category, :url, :view_limit, :view_span, :file)

  end

end
