class PdfsController < ApplicationController

  before_action :set_s3_direct_post

  def index
    @pdfs = Pdf.all
  end

  def new
  end

  def create
    @pdf = Pdf.create(pdf_content)
  end

  private

  def pdf_content
    params.require(:pdf).permit(:name)
  end

  def set_s3_direct_post
    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  end

end
