class Admin::OyambreController < ApplicationController
  include AuthenticatedSystem
  before_filter :login_required
  before_filter :set_locale

  layout "admin"

  def overview
    #ActiveScaffold::Bridges.run_all
    #ActiveScaffold::Bridges::Bridge.run_all
 
    cms_config = YAML::load(File.open(File.join(Rails.root, 'config', 'oyambre.yml'))) rescue {}
    # TODO take value from config if exists
    @models = admin_controllers.map do |c|
      {
        :controller => "admin/#{c}",
        :label      => I18n.t("activerecord.models.#{c.singularize}.other",
                              :default => c.pluralize.humanize.downcase),
        :icon       => "admin/#{c}_controller".classify.constantize.oyambre_icon
      }
    end
  end

  def admin_controllers
    all_controllers = Rails.application.routes.routes.map {|r| r.defaults[:controller]}.uniq
    controllers = all_controllers.select {|c| c =~ /^admin\//}.map {|c| c.gsub(/^admin\//, '') }.sort
    controllers.delete ("oyambre")

    # sort but put pages entry at the beginning
    controllers.delete("pages")
    controllers.unshift("pages")

    # remove hidden controllers
    controllers.delete_if { |c| "admin/#{c}_controller".classify.constantize.hide_in_overview? }
  end

  protected
  # TODO remove duplication with admin_controller. create module?
    def set_locale
      I18n.locale = Rails.configuration.oyambre.languages.first
    end
end
