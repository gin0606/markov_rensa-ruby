require "igo-ruby"

module MarkovRensa
  class Tagger < Igo::Tagger
    def initialize
      super(MarkovRensa::Configuration.dictionary)
    end
  end
end
