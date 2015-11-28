$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'markov_rensa'

MarkovRensa::Configuration.dictionary = 'spec/fixtures/ipadic'
