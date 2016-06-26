$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'markov_rensa'

if ENV["CODECLIMATE_REPO_TOKEN"]
  require "codeclimate-test-reporter"
  require 'simplecov'

  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[SimpleCov::Formatter::HTMLFormatter,CodeClimate::TestReporter::Formatter]

  dir = File.join("..", "coverage")
  SimpleCov.coverage_dir(dir)
  SimpleCov.start CodeClimate::TestReporter.configuration.profile
end

MarkovRensa::Configuration.dictionary = 'spec/fixtures/ipadic'
