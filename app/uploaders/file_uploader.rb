class FileUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  include CarrierWave::Video
  include CarrierWave::Video::Thumbnailer
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end
  # process encode_video: [:mp4, resolution: "200x200"]

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb, if: :image? do
    process resize_to_fit: [192, 192]
  end

  version :thumb_video, if: :video? do
    process thumbnail: [{format: 'png', quality: 10, size: 192, strip: true, logger: Rails.logger}]
    def full_filename for_file
      png_name for_file, version_name
    end
  end

  version :thumb_pdf, if: :pdf? do
    process :cover
    process resize_to_fit: [192, 192]
    process convert: :jpg
    def full_filename for_file
      super.chomp(File.extname(super)) + '.jpg'
    end
  end

  def png_name for_file, version_name
    %Q{#{version_name}_#{for_file.chomp(File.extname(for_file))}.png}
  end


  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  # def encode
  #   video = FFMPEG::Movie.new(@file.path)
  #   video_transcode = video.transcode(@file.path)
  # end

  protected

  def image?(file)
    file.content_type.include? 'image'
  end

  def video?(file)
    file.content_type.include? 'video'
  end

  def pdf?(file)
    file.content_type.include? 'pdf'
  end

  def cover
    manipulate! do |frame, index|
      frame if index.zero?
    end
  end

end
