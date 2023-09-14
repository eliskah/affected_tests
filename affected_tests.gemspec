# frozen_string_literal: true

require_relative "lib/affected_tests/version"

Gem::Specification.new do |spec|
  spec.name = "affected_tests"
  spec.version = AffectedTests::VERSION
  spec.authors = ["Shia"]
  spec.email = ["rise.shia@gmail.com"]

  spec.summary = "Tool-kit for testing based on changed files."
  spec.description = "Tool-kit for testing based on changed files."
  spec.homepage = "https://github.com/riseshia/affected_tests"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/riseshia/affected_tests"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "rotoscope"
  # spec.add_dependency "calleree"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
