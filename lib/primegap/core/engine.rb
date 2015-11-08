module Primegap
  module Core
    class Engine < ::Rails::Engine
      engine_name 'primegap_core'

      config.generators do |g|
        g.test_framework :rspec, fixture: false
        g.assets false
        g.helper false
      end
    end
  end
end
