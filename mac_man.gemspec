lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'mac_man/version'

Gem::Specification.new do |spec|
  spec.name        = 'mac_man'
  spec.version     =  MacMan::VERSION
  spec.summary     = 'Manipulate MAC addresses'
  spec.description = 'Generate and manipulate mac addresses'
  spec.authors     = ['Moritz Kraus']
  spec.email       = 'moritz.kraus@makandra.de'
  spec.homepage = 'https://makandra.com'
  spec.license = 'MIT'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").select {|f| f.match(/md$|^lib/) }
  end

  spec.require_paths = ['lib']
  spec.metadata['rubygems_mfa_required'] = 'true'
  spec.metadata['source_code_uri'] = 'https://github.com/moritz-makandra/mac_man'
end
