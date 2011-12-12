module Oyambre
  class Engine < Rails::Engine
    rake_tasks do
      load File.join(File.dirname(__FILE__), '../rails/railties/tasks.rake')
    end
  end
end
