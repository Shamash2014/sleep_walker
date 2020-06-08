
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sleep_walker/version"

Gem::Specification.new do |spec|
  spec.name          = "sleep_walker"
  spec.version       = SleepWalker::VERSION
  spec.authors       = ["Shamash2014"]
  spec.email         = ["warp.buddhist@gmail.com"]

  spec.summary       = "Crantabe based time slots generator"
  spec.description   = "Release power of crontab to generate apointment schedule"
  spec.homepage      = "http://rubygems.org/gems/sleep_walker"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '~> 2.0'

  spec.add_dependency "fugit", "~> 1.1"
  spec.add_dependency "chronic", "~> 0.10"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "timecop", "~> 0.9"
end
