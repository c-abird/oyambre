class MagickFilter
  def initialize(&block)
    @proc = block
  end

  def process(img)
    @proc.call(img)
  end
end

module Paperclip
  class Magick < Processor
    # Presets
    ROUND_CORNERS = MagickFilter.new { |img|
      mask = ::Magick::Image.new(img.columns, img.rows) {self.background_color = 'black'}
      gc = ::Magick::Draw.new
      gc.stroke('white').fill('white')
      gc.roundrectangle(0, 0, img.columns-1, img.rows-1, 5, 5)
      gc.draw(mask)

      mask.matte = false
      img.matte = true
      img.composite(mask, ::Magick::CenterGravity, ::Magick::CopyOpacityCompositeOp)
    }

    def initialize file, options = {}, attachment = nil
      super
      @file       = file
      @current_format     = File.extname(@file.path)
      @basename   = File.basename(@file.path, @current_format)
      @filter     = options[:magick]
      @attachment = nil
    end

    def make
      return @file if @filter.nil?

      # process src file with magick proc
      src_img = ::Magick::Image.read(File.expand_path(@file.path)).first
      dst_img = @filter.process(src_img)

      # Create Templfile object and write image data to its file
      dst = Tempfile.new([@basename, @current_format ? ".#{@current_format}" : ''])
      dst.binmode
      dst_img.write(File.expand_path(dst.path))

      # Return Tempfile object to Paperclip for further handling
      return dst
    end
  end
end

module Inshalla
  THUMBNAIL_STYLES = {
    :thumbnail_big => {
      :geometry => "155x93#",
      :format => :png,
      :magick => Paperclip::Magick::ROUND_CORNERS
    },
    :thumbnail => {
      :geometry => "45x45#",
      :format => :png,
      :magick => Paperclip::Magick::ROUND_CORNERS
    }
  }

  module ActiveRecord

    ## Define ModelMethods
    module Base
      def self.included(klass)
        klass.class_eval do
          extend Config
        end
      end
      
      module Config
        def has_attached_image(name, options = {})
          options[:styles] ||= {}
          options[:styles].merge!(Inshalla::THUMBNAIL_STYLES)
          options[:processors] = [:thumbnail, :magick]

          has_attached_file(name, options)
        end
      end
      
      module InstanceMethods
        # NOTHING
      end # InstanceMethods      
    end

  end
end

::ActiveRecord::Base.send :include, Inshalla::ActiveRecord::Base
