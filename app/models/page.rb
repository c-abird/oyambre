class Page < ActiveRecord::Base
  # TODO what to do on load! ???
  translates :translated_values
  # TODO rename before_save method
  before_save :before_save

  ### COLUMNS
  # dynamic_columns
  # values
  # translatated_values

  class DynamicColumn
    attr_reader :name, :type, :styles

    def initialize(definition)
      definition    = HashWithIndifferentAccess.new(definition)
      @name         = definition['name']              # no default
      @type         = definition['type'] || 'string'  # defaults to :string
      @translatable = !!definition['translatable']    # defaults to false
      @styles        = definition['styles'] || {}       # default paperclip styles
    end

    def translatable?
      @translatable
    end

    def to_h
      {
        :name => name,
        :type => type,
        :translatable => translatable?,
        :styles => styles
      }
    end
  end

  def translatable_columns
    dynamic_columns.select { |c| c.translatable? }.map(&:name)
  end

  def dynamic_columns
    if @dynamic_columns.nil?
      @dynamic_columns = []
      ActiveSupport::JSON.decode(read_attribute(:dynamic_columns) || '[]').each do |column|
        @dynamic_columns << DynamicColumn.new(column)
      end
    end
    @dynamic_columns
  end

  def method_missing(method_id, *args)
    begin
      super(method_id, *args)
    rescue NoMethodError
      # before_type_cast hack included (for rails 2.3.9) TODO check if it's ok
      column_name = (md = /_before_type_cast|\?|\=/.match(method_id.to_s)) ? md.pre_match : method_id.to_s
      column      = dynamic_columns.select { |c| c.name == column_name }.first
      raise if column.nil?

      json        = column.translatable? ? self.translated_values : self.values
      raw         = ActiveSupport::JSON.decode(json || '{}')

      #### WRITE ATTRIBUTE ####
      if md.to_s == '='
        if column.type == 'file'
          pa = page_attachment(column_name, raw)
          pa.file = args.first
          pa.save
          raw[column_name.to_s] = pa.id
        else
          raw[column_name.to_s] = args.first
        end

        if column.translatable?
          self.translated_values = raw.to_json
        else
          self.values = raw.to_json
        end

      #### READ ATTRIBUTE ####
      else
        if column.type == 'file'
          page_attachment(column_name, raw).file
        else
          raw[column_name.to_s]
        end
      end
    end
  end

  def before_save
    write_attribute(:dynamic_columns, dynamic_columns.map(&:to_h).to_json)
  end

  def name
    I18n.t("pages.#{ident}.label", :default => ident.humanize)
  end

  protected

  def page_attachment(column_name, raw)
    column = dynamic_columns.select { |c| c.name == column_name }.first

    if raw[column_name.to_s].blank? || PageAttachment.find_by_id(raw[column_name.to_s]).nil?
      pa = PageAttachment.create(:styles => column.styles)
      raw[column_name.to_s] = pa.id
      if column.translatable?
        self.translated_values = raw.to_json
      else
        self.values = raw.to_json
      end
      self.save
    end
    # TODO cache ?
    PageAttachment.find(raw[column_name.to_s])
  end

end
