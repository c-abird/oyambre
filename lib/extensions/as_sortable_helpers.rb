module ActiveScaffold::Helpers
  module SortableHelpers 
    def list_row_class(record)
      defined?(super) ? "sortable #{super(record)}" : "sortable"
    end
  end
end
