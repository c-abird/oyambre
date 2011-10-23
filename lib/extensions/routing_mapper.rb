module ActionDispatch
  module Routing
    INSHALLA_ADMIN_ROUTING = {
      #:member => {:translate => :get, :switch_to_live => :post, :switch_to_draft => :post}
      :member => {:translate => :get, :toggle_status => :post}
    }
    class Mapper
      module Base
        def admin_routes(options = {:association => true})
          member do
            ActionDispatch::Routing::INSHALLA_ADMIN_ROUTING[:member].each {|name, type| send(type, name)}
          end
          as_routes(options)
        end
      end
    end
  end
end
