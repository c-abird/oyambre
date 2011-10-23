module Paperclip
  module MigrationHelper
    module TableDefinition
      def self.included(base) # :nodoc:
        base.send(:include, InstanceMethods)
      end

      module InstanceMethods
        def file(name = 'attachment')
          column("#{name}_file_name", :string)
          column("#{name}_content_type", :string)
          column("#{name}_file_size", :integer)
        end
      end      
    end
    
    class PageDefinition
      def initialize(page)
        @page = page
      end

      def string(name, options = {})
        add_column(options.merge({ :name => name.to_s, :type => 'string' }))
      end

      def plain_text(name, options = {})
        add_column(options.merge({ :name => name.to_s, :type => 'plain_text' }))
      end

      def text(name, options = {})
        plain_text(name, options)
      end

      def html_text(name, options = {})
        add_column(options.merge({ :name => name.to_s, :type => 'html_text' }))
      end

      def file(name, options = {})
        add_column(options.merge({ :name => name.to_s, :type => 'file' }))
      end

      protected

        def add_column(options)
          @page.dynamic_columns << Page::DynamicColumn.new(options)
        end
    end

    module Schema
      def self.included(base) # :nodoc:
        base.send(:include, InstanceMethods)
      end

      module InstanceMethods
        def add_file_columns(table_name, name)
          add_column(table_name, "#{name}_file_name", :string)
          add_column(table_name, "#{name}_content_type", :string)
          add_column(table_name, "#{name}_file_size", :string)
        end
        
        def remove_file_columns(table_name, name)
          remove_column(table_name, "#{name}_file_name")
          remove_column(table_name, "#{name}_content_type")
          remove_column(table_name, "#{name}_file_size")
        end

        def create_page(ident)
          page = Page.new :ident => ident.to_s
          yield PageDefinition.new(page)
          page.save
        end

        def drop_page(ident)
          Page.find_by_ident(ident.to_s).destroy
          # delete attacheed files if existent
        end

        def add_page_column(ident, column, type, options = {})
          page = Page.find_by_ident(ident.to_s)
          page.dynamic_columns << Page::DynamicColumn.new(
            options.merge({ :name => column, :type => type })
          )
          page.save
        end

        def remove_page_column(ident, column)
          page = Page.find_by_ident(ident.to_s)
          page.dynamic_columns.delete_if {|c| c.name.to_s == column.to_s}
          page.save
          # delete attacheed files if existent
        end
      end      
    end
  end
end

ActiveRecord::ConnectionAdapters::TableDefinition.send(:include, Paperclip::MigrationHelper::TableDefinition)
ActiveRecord::ConnectionAdapters::AbstractAdapter.send(:include, Paperclip::MigrationHelper::Schema)
