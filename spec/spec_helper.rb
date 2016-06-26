$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'markov_rensa'

if ENV['CI']
  require 'coveralls'
  Coveralls.wear!('rails')
end

MarkovRensa::Configuration.dictionary = 'spec/fixtures/ipadic'
