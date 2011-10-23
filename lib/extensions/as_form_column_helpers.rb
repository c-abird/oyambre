module ActiveScaffold
  module Helpers
    module FormColumnHelpers
      # PATCH:
      # added active record class to id_control to avoid name clashes
      def active_scaffold_input_options(column, scope = nil, options = {})
        name = scope ? "record#{scope}[#{column.name}]" : "record[#{column.name}]"

        # Fix for keeping unique IDs in subform
        id_control = "record_#{column.active_record_class.to_s.underscore}_#{column.name}_#{[params[:eid], params[:id]].compact.join '_'}"
        id_control += scope.gsub(/(\[|\])/, '_').gsub('__', '_').gsub(/_$/, '') if scope

        { :name => name, :class => "#{column.name}-input", :id => id_control}.merge(options)
      end
    end
  end
end
