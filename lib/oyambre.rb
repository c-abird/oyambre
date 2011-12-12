# essential requires
require 'rails'
require 'active_support/all'

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
end
