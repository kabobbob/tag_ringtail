# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name        = 'tag_ringtail'
  s.version     = '0.0.1'
  s.authors     = ['Bob McClellan Jr']
  s.email       = ['bob.mcclellan@gmail.com']
  s.homepage    = 'https://github.com/kabobbob/tag_ringtail'
  s.summary     = 'The Tag Ringtail'
  s.description = 'This friendly ringtail gives you tags in your Rails app.'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ['lib']
end
