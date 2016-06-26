$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'markov_rensa'

if ENV['CODECLIMATE_REPO_TOKEN']
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
end

MarkovRensa::Configuration.dictionary = 'spec/fixtures/ipadic'
