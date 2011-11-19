require 'rails/generators/rails/resource/resource_generator'
#require 'generators/active_scaffold_controller/active_scaffold_controller_generator'

module Rails
  module Generators
    class OyambreResourceGenerator < ResourceGenerator #metagenerator
      remove_hook_for :resource_controller
      remove_class_option :actions
      
      def add_resource_route
        route_config =  class_path.unshift('admin').collect{|namespace| "namespace :#{namespace} do " }.join(" ") 
        route_config << "resources :#{file_name.pluralize} do admin_routes end"
        route_config << " end" * class_path.size 
        route route_config
      end 
     
      invoke "oyambre_controller"
    end
  end
end
