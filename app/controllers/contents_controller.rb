class ContentsController < ApplicationController

  def index
  end

  def new
    @content = Content.new
  end

  def show
  end

  def create
    content = content_params
    if content['file'].content_type.include? 'video'
      create_video(content)
    else
      create_pdf(content)
    end
  end

  private

  def content_params
    params.require(:content).permit(:category, :view_limit, :view_span, :file)
  end

  def create_video(content)
    video = Video.new(content)
    if video.valid?
      video.save
    else
      p video.errors
    end
  end

  def create_pdf(content)
    pdf = Pdf.new(content)
    if pdf.valid?
      pdf.save
    else
      p pdf.errors
    end
  end

end
