class PdfsController < ApplicationController

  def index
    @pdfs = Pdf.all
  end

  def new
  end

  def create
    @pdf = Pdf.new(pdf_content)
    if @pdf.valid?
      @pdf.save
    else
      p @pdf.errors
    end
  end

  private

  def pdf_content
    params.require(:pdf).permit(:category, :view_limit, :view_span, :file)
  end

end
