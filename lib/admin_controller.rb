class AdminController < ActionController::Base # TODO whats up with the application controller
  include AuthenticatedSystem

  #before_filter :login_required
  before_filter :reorder_links
  layout false

  class << self
    # combined read/writer for controller icon
    def inshalla_icon(icon = nil)
      @inshalla_icon = icon unless icon.nil?
      @inshalla_icon
    end

    # call if controller should be hidden in overview (e.g. for nested controllers)
    def hide_in_overview
      @hide_in_overview = true
    end

    def hide_in_overview?
      !!@hide_in_overview
    end

    def active_scaffold(classname, &block)
      cms_config    = YAML::load(File.open(File.join(Rails.root, 'config', 'inshalla.yml'))) rescue {}
      klass         = classname.to_s.classify.constantize
      helper_module = self.name.to_s.gsub(/Controller$/, "Helper").constantize rescue nil

      # init languages
      languages = cms_config['languages'] || [Rails.configuration.i18n.default_locale.to_s || 'en']
      master_language = languages.shift

      ####  TRANSLATION ####
      # TODO check wheather columns need to be translated
      define_method :translate do
        locale = params[:admin_locale]
        with_locale(locale, klass) do 
          @record = klass.find(params[:id])

          label = @record.to_label       # save label
          def @record.to_label; nil; end # clear label to set headline
          language_trans = I18n.t("inshalla.lang.#{locale}", :default => locale)
          headline_trans = I18n.t("inshalla.translate.headline", :model => label, :language => language_trans)
          active_scaffold_config.update.label = headline_trans

          # retrieve the columns to be translated (special rule for page class)
          columns = (klass == Page) ? @record.translatable_columns : @record.translated_attributes.keys

          prev_columns = active_scaffold_config.update.columns # save column configuration
          active_scaffold_config.update.columns = columns
          respond_to_action(:edit)
          active_scaffold_config.update.columns = prev_columns # restore column configuration
        end
      end

      define_method :before_update_save do |record|
        if !record.valid? and params[:admin_locale] != master_language
          columns = record.translated_attributes.keys
          active_scaffold_config.update.columns = columns
        end
      end

      define_method :edit do
        with_locale(params[:admin_locale], klass) { super() }
      end

      define_method :update do
        with_locale(params[:admin_locale], klass) { super() }
      end

      define_method :do_update do
        with_locale(params[:admin_locale], klass) { super() }
      end

      #### STATUS (DRAFT/LIVE) ####
      # TODO update
      #if klass.columns.map {|c| c.name}.include?("status")
      if klass.publishable?
        define_method("toggle_status") do
          @record = klass.find params[:id]
          @record.update_attribute(:status, (@record.status == 'live') ? 'draft' : 'live')
          render :template => 'active_record/frontends/default/update_row.js.rjs'
        end

        helper_module.class_eval do
          define_method :list_row_class do |record|
            record.status == 'live' ? 'live' : 'draft'
          end
        end unless helper_module.nil?
      end


      #### PRECONFIGURE ACTIVE SCAFFOLD ####
      super classname do |config|
        # translate model
        config.label = I18n.t(
          "activerecord.models.#{classname.to_s.singularize}.other",
          :default => classname.to_s.pluralize.humanize
        )

        # translation links
        languages.each do |language|
          config.action_links.add(:translate,
                                  :label => language,
                                  :html_options => {'lang' => language},
                                  :parameters => { :admin_locale => language },
                                  :type => :member,
                                  :position => :replace) if klass.translates?
        end
        config.update.link.parameters = { :admin_locale => master_language } # HACK
       
        # set toggle live button
        # TODO update
        if klass.publishable?
          config.action_links.add(:toggle_status,
                                  :method => :post,
                                  :label => I18n.t("inshalla.acts_as_publishable.toggle", :default => 'toggle status'),
                                  :type => :member,
                                  :confirm => I18n.t("inshalla.acts_as_publishable.confirm"),
                                  :position => false
                                 )
        end

        # configure translated columns
        if klass.translates?
          config.columns.exclude :translations
          klass.translated_attribute_names.each do |col|
            config.columns.add(col)
            config.update.columns.add(col)
            config.create.columns.add(col)
          end
        end

        # hide some action links
        config.show.link   = false
        config.search.link = false

        block.call(config)

        # translate columns
        config.columns.each do |column|
          column.label = I18n.t(
            "activerecord.attributes.#{classname.to_s.singularize}.#{column.name}",
            :default => column.name.to_s.humanize
          )
        end

      end
    end
  end

  protected
    # before filter that reorders the action links
    def reorder_links
      links = active_scaffold_config.action_links
      publish_link = links[:toggle_status]
      if publish_link
        links.delete(:toggle_status)
        links << publish_link
      end
    end

    # TODO remove klass argument???
    def with_locale(locale, klass = I18n, &block)
      Globalize.with_locale(locale, &block)
    end
end
