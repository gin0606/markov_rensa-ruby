require 'spec_helper'

describe MarkovRensa::Tagger do
  describe '.new' do
    subject { MarkovRensa::Tagger.new }
    it { is_expected.to be_a MarkovRensa::Tagger }
    it { is_expected.to be_a Igo::Tagger }
  end
end
