# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "serf-td-agent"
  s.version     = "0.1.0"
  s.authors     = ["Naotoshi Seo"]
  s.email       = ["sonots@gmail.com"]
  s.homepage    = "http://github.com/sonots/serf-td-agent"
  s.summary     = "A td-agent process management with serf"
  s.description = s.summary
  s.extensions  = ["ext/serf-td-agent/extconf.rb"]
  s.licenses    = ["MIT"]

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  # s.require_paths = ["lib"]

  s.add_runtime_dependency "gem-path", '~> 0'
  s.add_runtime_dependency "rubyzip", '~> 0'
  s.add_development_dependency "rake", '~> 0'
end
