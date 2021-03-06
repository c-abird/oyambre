#require 'rails/generators/rails/scaffold_controller/scaffold_controller_generator'

module Rails
  module Generators
    class OyambreControllerGenerator < NamedBase #metagenerator
      include ResourceHelpers

      def self.source_root
         @source_root ||= File.join(File.dirname(__FILE__), 'templates')
      end

      # TODO check namespace
      check_class_collision :suffix => "Controller"
      #check_class_collision :prefix => "Admin::", :suffix => "Controller"

      class_option :orm, :banner => "NAME", :type => :string, :required => true,
                         :desc => "ORM to generate the controller for"

      def create_controller_files
        template 'controller.rb', File.join('app/controllers/admin', class_path, "#{controller_file_name}_controller.rb")
        template 'helper.rb', File.join('app/helpers/admin', class_path, "#{controller_file_name}_helper.rb")
      end

      #hook_for :test_framework, :as => :scaffold

      def create_view_root_folder
        empty_directory File.join("app/views/admin", controller_file_path)
      end 
    end
  end
end
