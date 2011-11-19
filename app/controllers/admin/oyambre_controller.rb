class Admin::OyambreController < ApplicationController
  include AuthenticatedSystem
  before_filter :login_required

  layout "admin"
  #uses_tiny_mce :options => {
  #  :width => 620,
  #  :theme => 'advanced',
  #  :theme_advanced_buttons1 => "formatselect,bold,italic,separator,undo,redo,separator,code,cleanup,separator,bullist,numlist,separator,link,unlink",
  #  :theme_advanced_buttons2 => "",
  #  :theme_advanced_buttons3 => "",
  #  :dialog_type => "modal",
  #  :cleanup => true,
  #  :theme_advanced_toolbar_location => "top",
  #  :theme_advanced_statusbar_location => "bottom",
  #  :theme_advanced_resizing => true,
  #  :theme_advanced_resize_horizontal => false,
  #  :theme_advanced_path => false,
  #  :theme_advanced_toolbar_align => "left",
  #  :theme_advanced_blockformats => "p,h2,h3",
  #  :valid_elements => "-p,-h2,-h3,-ul,-ol,-li,-a[href|target],-strong,br,-em"
  #}

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
end
