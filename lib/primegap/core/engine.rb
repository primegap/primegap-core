module Primegap
  module Core
    class Engine < ::Rails::Engine
      engine_name 'primegap_core'

      config.generators do |g|
        g.test_framework :rspec, fixture: false
        g.assets false
        g.helper false
      end

      initializer :append_migrations do |app|
        unless app.root.to_s.match root.to_s
          config.paths['db/migrate'].expanded.each do |expanded_path|
            app.config.paths['db/migrate'] << expanded_path
          end
        end
      end
    end
  end
end
