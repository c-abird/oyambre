class PageAttachment < ActiveRecord::Base
  has_attached_file(:file, {
    :styles => lambda { |a| a.instance.styles },
    :processors => [:thumbnail, :magick]
  })

  def styles=(styles)
    write_attribute(:styles, styles.to_json)
  end

  def styles
    result = HashWithIndifferentAccess.new(
      ActiveSupport::JSON.decode(read_attribute(:styles) || "{}")
    ).symbolize_keys
    if result.delete(:thumbnails)
      # TODO remove dublication with active record extension
      result.merge(Inshalla::THUMBNAIL_STYLES)
    else
      result
    end
  end
end