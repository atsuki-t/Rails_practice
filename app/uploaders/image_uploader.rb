class ImageUploader < CarrierWave::Uploader::Base
  #   # Include RMagick or MiniMagick support:
  #   include CarrierWave::RMagick
  #   # include CarrierWave::MiniMagick

  #   # Choose what kind of storage to use for this uploader:
  #   storage :file
  #   # storage :fog

  #   # Override the directory where uploaded files will be stored.
  #   # This is a sensible default for uploaders that are meant to be mounted:
  #   def store_dir
  #     "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  #   end

  #   # Provide a default URL as a default if there hasn't been a file uploaded:
  #   # def default_url(*args)
  #   #   # For Rails 3.1+ asset pipeline compatibility:
  #   #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #   #
  #   #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  #   # end

  #   # 上限変更
  #   process resize_to_limit: [700, 700]

  #   # JPGで保存
  #   process convert: 'jpg'

  #   # サムネイルを生成
  #   version :thumb do
  #     process resize_to_limit: [300, 300]
  #   end

  #   # jpg,jpeg,gif,pngのみ
  #   def extension_white_list
  #     %w[jpg jpeg gif png]
  #   end

  #   # 日付で保存
  #   def filename
  #     super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
  #     time = Time.now
  #     name = time.strftime('%Y%m%d%H%M%S') + '.jpg'
  #     name.downcase
  #     return name.downcase if original_filename.present?
  #   end
end
