require_relative "lib/immosquare-constants/version"


Gem::Specification.new do |spec|
  spec.platform      = Gem::Platform::RUBY
  spec.license       = "MIT"
  spec.name          = "immosquare-constants"
  spec.version       = ImmosquareConstants::VERSION.dup

  spec.authors       = ["IMMO SQUARE"]
  spec.email         = ["jules@immosquare.com"]
  spec.homepage      = "https://github.com/IMMOSQUARE/immosquare-constants"

  spec.summary       = ""
  spec.description   = ""


  spec.files         = Dir["lib/**/*"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.2")
end
