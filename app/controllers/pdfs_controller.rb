class PdfsController < ApplicationController

  def index
    @pdfs = Pdf.all
  end
end
