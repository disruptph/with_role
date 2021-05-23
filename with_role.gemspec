lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "with_role/version"

Gem::Specification.new do |spec|
  spec.name          = "with_role"
  spec.version       = WithRole::VERSION
  spec.authors       = ["jude_cali"]
  spec.email         = ["jcalimbas@fullscale.io"]

  spec.summary       = %q{Simple role feature.}
  spec.description   = %q{Simple role feature.}
  spec.homepage      = "https://github.com/disruptph/with_role"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/disruptph/with_role"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", "~> 6.1.3"
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_development_dependency "rubocop",                                 "~> 0.74"
end
