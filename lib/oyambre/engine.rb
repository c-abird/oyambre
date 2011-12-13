module Oyambre
  class Engine < Rails::Engine
    rake_tasks do
      load File.join(File.dirname(__FILE__), '../rails/railties/tasks.rake')
    end

    initializer 'oymabre.asset_pipeline' do |app|
      app.config.assets.precompile += %w( oyambre/admin.js oyambre/admin.css )
    end
  end
end
