class ImageUploader < CarrierWave::Uploader::Base

  # リサイズしたり画像形式を変更するのに必要
  include CarrierWave::RMagick
 
  # 5mbまでのファイルのみにする
  def size_range
  1..5.megabytes
  end
 
  # 保存形式をJPGにする
  process :convert => 'jpg'
 
  # サムネイルを生成する設定
  version :thumb do
    process :resize_to_limit => [1024, 576]
  end
  
  # version :thumb150 do
  #   process :resize_to_limit => [150, 150]
  # end
  
  version :plad do
    process :resize_to_fill => [300, 300]
  end
 
  # jpg,jpeg,gif,pngしか受け付けない
  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
  # 画像の登録が無い場合はデフォルト画像が表示される
  def default_url
    "default.jpg"
  end
 
  # 拡張子が同じでないとGIFをJPGとかにコンバートできないので、ファイル名を変更
  def filename
    super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
  end
 
  # ファイル名を日付にするとタイミングのせいでサムネイル名がずれる
  #ファイル名はランダムで一意になる
  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end
 
  protected
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end
 
 

  # Include RMagick or MiniMagick support:
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
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

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do

  # end

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
end
