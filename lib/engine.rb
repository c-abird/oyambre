# essential requires
require 'inshalla'
require 'rails'
require 'active_support/all'

# requies for controller and helper extensiosn
require 'action_controller'
require 'application_helper'

# gem dependencies
#require 'extensions/paperclip_form_ui'
require 'globalize3'
require 'acts_as_list'
require 'paperclip'
require 'active_scaffold_vho'
require 'active_scaffold_sortable_vho'
require 'tiny_mce'
require 'RMagick'

# TODO hack, clean up
ActionController::Base.send(:include, TinyMCE::Base)
ActionController::Base.send(:helper, TinyMCE::Helpers)

# extensions
require 'extensions/paperclip_form_ui'
require 'extensions/paperclip_extension'
require 'extensions/routing_mapper'
require 'extensions/migration_helper'
require 'extensions/as_form_column_helpers.rb'
require 'extensions/as_sortable_helpers.rb'
require 'extensions/acts_as_publishable.rb'

require 'authentication/authentication'
require 'authentication/by_cookie_token'
require 'authentication/by_password'
require 'authentication/authenticated_system'

require 'admin_controller'

module Inshalla
  def self.root
    File.dirname(__FILE__) + "/.."
  end

  def self.copy_assets(dir, pattern)
    src = File.join(Inshalla.root, 'public', dir, pattern)
    dst = File.join(Rails.root, 'public', dir)

    FileUtils.mkdir_p(dst)
    FileUtils.cp(Dir.glob(src), dst)
  end

  class Engine < Rails::Engine
    rake_tasks do
      load File.join(File.dirname(__FILE__), 'rails/railties/tasks.rake')
    end
    
    initializer "copy static assets" do |app|
      src = File.join(Inshalla.root, 'public', '*')
      dst = File.join(Rails.root, 'public')

      Inshalla.copy_assets(File.join('javascripts', 'inshalla'), "*.js")
      Inshalla.copy_assets(File.join('stylesheets', 'inshalla'), "*.css")
      Inshalla.copy_assets(File.join('images', 'inshalla'), "*.*")
      Inshalla.copy_assets(File.join('images', 'inshalla', 'modelicons'), "*.*")
      Inshalla.copy_assets(File.join('images', 'inshalla', 'icons'), "*.*")
      Inshalla.copy_assets(File.join('images', 'inshalla', 'flags'), "*.*")
      Inshalla.copy_assets(File.join('fonts'), "*.*")
    end
  end
end
