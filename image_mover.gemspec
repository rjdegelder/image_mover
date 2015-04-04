# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name        = 'image_mover'
  s.version     = '0.0.1'
  s.date        = '2015-04-04'
  s.summary     = 'Organizes your image files'
  s.description = 'Organizes your image files'
  s.authors     = ['Robert Jan de Gelder']
  s.email       = ['rjdegelder@gmail.com']
  s.homepage    = 'http://github.com/rjdegelder/image_mover'
  s.license     = 'MIT'

  s.files       = `git ls-files`.split($/)
  s.executables = s.files.grep(%r{^bin/}) { |f| File.basename(f) }

  s.add_dependency 'exifr', '1.2.1'
end