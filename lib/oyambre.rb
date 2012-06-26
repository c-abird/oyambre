# essential requires
require 'rails'
require 'active_support/all'
require 'ostruct'

# requies for controller and helper extensiosn
require 'action_controller'
require 'oyambre/application_helper'

# gem dependencies
require 'globalize3'
require 'acts_as_list'
require 'paperclip'
require 'active_scaffold'
require 'active_scaffold_sortable'
require 'tinymce-rails'
require 'RMagick'

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

require 'oyambre/admin_controller'
require 'oyambre/engine'

module Oyambre
  def self.root
    File.dirname(__FILE__) + "/.."
  end

  def self.defaults
    defaults = {
      :tinymce => {
        :cleanup => true,
        :dialog_type => 'modal',
        :editor_selector => 'mceEditor',
        :language => 'de',
        :mode => 'textareas',
        :theme => 'advanced',
        :theme_advanced_blockformats => 'p,h2,h3',
        :theme_advanced_buttons1 => 'formatselect,bold,italic,separator,undo,redo,separator,code,cleanup,separator,bullist,numlist,separator,link,unlink',
        :theme_advanced_buttons2 => '',
        :theme_advanced_buttons3 => '',
        :theme_advanced_path => false,
        :theme_advanced_resize_horizontal => false,
        :theme_advanced_resizing => true,
        :theme_advanced_statusbar_location => 'bottom',
        :theme_advanced_toolbar_align => 'left',
        :theme_advanced_toolbar_location => 'top',
        :valid_elements => '-p,-h2,-h3,-ul,-ol,-li,-a[href|target],-strong,br,-em',
        :width => '620'
      }
    }
  end
end
