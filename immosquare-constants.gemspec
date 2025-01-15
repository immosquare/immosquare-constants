require_relative "lib/immosquare-constants/version"


Gem::Specification.new do |spec|
  spec.platform      = Gem::Platform::RUBY
  spec.license       = "MIT"
  spec.name          = "immosquare-constants"
  spec.version       = ImmosquareConstants::VERSION.dup

  spec.authors       = ["immosquare"]
  spec.email         = ["jules@immosquare.com"]
  spec.homepage      = "https://github.com/immosquare/immosquare-constants"

  spec.summary       = "ImmosquareConstants is a comprehensive collection of constants useful for a variety of applications."
  spec.description   = "ImmosquareConstants gem provides a robust set of constants to facilitate application development across various domains"


  spec.files         = Dir["lib/**/*"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = Gem::Requirement.new(">= 3.2.6")
end
