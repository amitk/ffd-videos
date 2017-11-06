class VideosController < ApplicationController
  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.create(video_params)
    index
    render :index
  end

  private

  def video_params
    params.require(:video).permit(:category, :view_limit, :view_span, :file)
  end

end
