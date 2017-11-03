class VideosController < ApplicationController
  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.valid?
      @video.save
    else
      p @video.errors
    end
  end

  private

  def video_params
    params.require(:video).permit(:category, :view_limit, :view_span, :file)
  end

end
