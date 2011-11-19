module Oyambre
  module ActsAsPublishable

    ## Define ModelMethods
    module Base
      def self.included(klass)
        klass.class_eval do
          extend Config
        end
      end
      
      module Config
        def acts_as_publishable(options = {})
          include ::Oyambre::ActsAsPublishable::Base::InstanceMethods
          self.publishable = true
        end

        def publishable?
          !!self.publishable
        end

        def has_many_publishable(association_id, options = {})
          has_many(association_id, options) do
            def live
              #find :all, :conditions => { :status => 'live' }
              # TODO: new syntax, check!
              where(:status => 'live')
            end
          end
        end

        def publishable?
        end
      end
      
      module InstanceMethods
        def publish
          return false unless is_publishable?
          update_attribute :status, 'live'
          true
        end

        def authorized_for_switch_to_live?
          status == 'draft'
        end

        def authorized_for_switch_to_draft?
          status == 'live'
        end
      end
    end
  end
end

::ActiveRecord::Base.send :include, Oyambre::ActsAsPublishable::Base
::ActiveRecord::Base.send :class_attribute, :publishable
