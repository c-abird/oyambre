class Admin::PagesController < AdminController
  before_filter :setup_columns

  def setup_columns
    config = active_scaffold_config
    config.update.columns = []

    page = Page.find_by_id(params[:id])

    return if page.nil?

    page.dynamic_columns.each do |col|
      config.columns.add(col.name)
      config.update.columns.add(col.name)

      # set column types
      # TODO date picker ...
      case col.type
      when 'string'
        # use default
      when 'html_text'
        config.columns[col.name].form_ui = 'text_editor'
        config.columns[col.name].options[:tinymce] = Oyambre.defaults[:tinymce]
      when 'plain_text'
        config.columns[col.name].form_ui = 'textarea'
      when 'file'
        config.columns[col.name].form_ui = 'paperclip'
        config.columns[col.name].params.add "delete_#{col.name}"
        config.update.multipart = true
        config.create.multipart = true
      when 'select'
        config.columns[col.name].form_ui = 'select'
        config.columns[col.name].options = {:options => col.options}
      end

      # translate labels
      column = I18n.t("pages.#{page.ident}.columns.#{col.name}", :default => col.name.humanize)
      config.columns[col.name].label   = column.is_a?(Hash) ? column[:label] : column
      config.columns[col.name].form_ui = column[:type].to_s if column.is_a?(Hash) && column.has_key?(:type)
    end
  end

  oyambre_icon 'pages'

  active_scaffold :page do |config|
    config.label = I18n.t('oyambre.pages')
    config.delete.link  = false
    config.show.link    = false
    config.create.link  = false

    # TODO set name label
    config.list.columns = [:name]
  end
end
