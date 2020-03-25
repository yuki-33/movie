# encoding: utf-8

class BaseImageUploader < CarrierWave::Uploader::Base

  def optimize
    manipulate! do |img|
      img.strip
      img.combine_options do |c|
        c.quality "80"
        c.depth "8"
        c.interlace "plane"
      end
      img
    end
  end
end
