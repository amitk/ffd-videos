class PdfsController < ApplicationController

  def index
    @pdfs = Pdf.all
  end

  def new
  end

  def create
    @pdf = Pdf.create(pdf_content)
    render json: {message: 'file uploaded successfully!'}
  end

  private

  def pdf_content
    params.require(:pdf).permit(:category, :view_limit, :view_span, :file)
  end

end
