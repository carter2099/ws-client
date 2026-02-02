require 'English'
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ws_client/version'

Gem::Specification.new do |spec|
  spec.name          = "ws-client"
  spec.version       = WSClient::VERSION
  spec.authors       = ["Sho Hashimoto", "Yusuke Nakamura"]
  spec.email         = ["hashimoto@shokai.org", "yusuke1994525@gmail.com"]
  spec.description   = 'Simple WebSocket Client for Ruby'
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/carter2099/ws-client"
  spec.license       = "MIT"
  spec.required_ruby_version = '>= 3.4.0'

  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = spec.homepage
    spec.metadata["changelog_uri"] = "https://github.com/carter2099/ws-client/blob/master/CHANGELOG.md"
    spec.metadata['rubygems_mfa_required'] = 'true'
  end

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR).reject { |f| f == "Gemfile.lock" }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "eventmachine"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "websocket-eventmachine-server"

  spec.add_dependency "base64"
  spec.add_dependency "event_emitter"
  spec.add_dependency "mutex_m"
  spec.add_dependency "websocket"
end
