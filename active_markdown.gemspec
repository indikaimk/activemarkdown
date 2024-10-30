require_relative "lib/active_markdown/version"

Gem::Specification.new do |spec|
  spec.name        = "active_markdown"
  spec.version     = ActiveMarkdown::VERSION
  spec.authors     = [ "Indika Kodagoda" ]
  spec.email       = [ "indika@cloudqubes.com" ]
  spec.homepage    = "https://github.com/indikaimk/activemarkdown"
  spec.summary     = "Active Markdown"
  spec.description = "GUI Markdown"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://github.com/indikaimk/activemarkdown'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/indikaimk/activemarkdown"
  spec.metadata["changelog_uri"] = "https://github.com/indikaimk/activemarkdown/changelog"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.2.1.2"
  spec.add_dependency "redcarpet", "~> 3.6"
end
