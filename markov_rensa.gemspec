# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'markov_rensa/version'

Gem::Specification.new do |spec|
  spec.name          = 'markov_rensa-ruby'
  spec.version       = MarkovRensa::VERSION
  spec.authors       = ['gin0606']
  spec.email         = ['kkgn06@gmail.com']

  spec.summary       = 'マルコフ連鎖で文章を生成する'
  spec.homepage      = 'https://github.com/gin0606/markov_rensa-ruby'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'igo-ruby', '~> 0.1.5'
  spec.add_dependency 'mem'

  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'codeclimate-test-reporter'
end
