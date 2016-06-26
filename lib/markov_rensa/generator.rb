require 'mem'

module MarkovRensa
  class Generator
    include Mem

    attr_reader :order

    def initialize(order = 1)
      @order = order
    end

    def add_string(string)
      sentences = split_sentence(string)
      sentences.each do |sentence|
        wakati = tagger.wakati(sentence)
        start_wards << wakati[0, order]

        until wakati.size < order + 1
          (wards[wakati[0, order]] ||= []) << wakati[order]
          wakati.shift
        end
      end
      sentences
    end

    def sentence
      sentence = (start_wards.sample || [])
      while (nw = (wards[sentence[-order, order]] || []).sample)
        sentence << nw
      end
      sentence.join('')
    end

    def sentences(n = 1)
      Array.new(n) do
        sentence
      end
    end

    private

    def split_sentence(string)
      return [] if string.empty?
      return [string] unless string.include?('。')
      string.scan(/[^。]*。/)
    end

    def tagger
      Tagger.new
    end
    memoize :tagger

    def start_wards
      []
    end
    memoize :start_wards

    def wards
      {}
    end
    memoize :wards
  end
end
