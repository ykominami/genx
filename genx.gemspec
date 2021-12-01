# frozen_string_literal: true

require_relative "lib/genx/version"

Gem::Specification.new do |spec|
  spec.name          = "genx"
  spec.version       = Genx::VERSION
  spec.authors       = ["yasuo kominami"]
  spec.email         = ["ykominami@gmail.com"]

  spec.summary       = "generete a text file."
  spec.description   = "generete a text file."
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.5.0"


#  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ykominami/genx.git"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "erubis"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "coderay"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'rubocop-rake'
  spec.add_development_dependency "minitest"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
