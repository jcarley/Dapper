require 'rails/railtie'

module Dapper
  class Railtie < Rails::Railtie

    config.to_prepare do
      ::Dapper::System.load_app_local_presenters
    end

    config.after_initialize do |app|
      app.config.paths.add 'app/presenters', :eager_load => true
    end

    initializer "dapper.extend_action_controller_base" do |app|
      ActiveSupport.on_load(:action_controller) do
        Dapper::System.setup(self)
      end
    end

  end
end
