module Blorgh
  class Engine < ::Rails::Engine
    isolate_namespace Blorgh

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot
      g.factory_bot dir: 'spec/factories'
    end

    config.autoload_paths += Dir["#{config.root}/app/**/concerns"]
    config.autoload_paths += Dir["#{config.root}/public/*"]

    # Allow accessing engine factories from within a project
    initializer "blorgh.factories", after: "factory_bot.set_factory_paths" do
      FactoryBot.definition_file_paths << File.expand_path('../../spec/factories', __dir__) if defined?(FactoryBot)
    end

    # To be able to run migrations without copying it to the outside app
    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end
  end
end
