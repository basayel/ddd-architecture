module AppBase
  class Engine < ::Rails::Engine
    isolate_namespace AppBase
  end
end
