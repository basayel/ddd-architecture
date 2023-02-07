require_relative "lib/app_base/version"

Gem::Specification.new do |spec|
  spec.name        = "app_base"
  spec.version     = AppBase::VERSION
  spec.authors     = ["Basayel Said"]
  spec.email       = ["eng.basayel.said@gmail.com"]
  spec.homepage    = "https://github.com/espace/ebooster-backend.git"
  spec.summary     = ""
  spec.description = ""

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/espace/ebooster-backend.git"
  spec.metadata["changelog_uri"] = "https://github.com/espace/ebooster-backend.git"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", "7.0.4.2"
  spec.add_dependency "batch-loader", "2.0.1"
end
