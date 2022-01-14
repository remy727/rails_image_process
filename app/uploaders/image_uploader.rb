require "image_processing/mini_magick"
 
class ImageUploader < Shrine
  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)
 
    { 
      small:  magick.resize_to_limit!(300, 300),
      medium: magick.resize_to_limit!(500, 500),
      large:  magick.resize_to_limit!(800, 800),
    }
  end
end