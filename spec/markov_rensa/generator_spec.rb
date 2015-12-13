require 'spec_helper'

describe MarkovRensa::Generator do
  # generator = MarkovRensa::Generator.new
  # generator.add_string('メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意した。')
  # generator.add_string('メロスには政治がわからぬ。メロスは、村の牧人である。笛を吹き、羊と遊んで暮して来た。けれども邪悪に対しては、人一倍に敏感であった。')
  # p generator.sentences(3)

  describe '#order' do
    subject { generator.order }
    context 'newに引数渡さなかった時' do
      let(:generator) { MarkovRensa::Generator.new }
      it { is_expected.to eq 1 }
    end

    context 'newに引数渡した時' do
      let(:generator) { MarkovRensa::Generator.new(order) }
      let(:order) { 3 }
      it { is_expected.to eq order }
    end
  end

  describe '#add_string' do
    subject { MarkovRensa::Generator.new.add_string(string) }

    context '空文字渡した時' do
      let(:string) { '' }
      it { is_expected.to be_empty }
    end

    context '文章渡した時' do
      let(:string) { 'メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意した。' }
      let(:sentences) { string.scan(/[^。]*。/) }
      it { is_expected.to contain_exactly *sentences }
    end

    context '読点無い文字列渡した時' do
      let(:string) { '必ず、かの邪智暴虐の王を除かなければならぬと決意した' }
      let(:sentences) { [string] }
      it { is_expected.to contain_exactly *sentences }
    end
  end

  describe '#sentence' do
    subject { generator.sentence }
    let(:generator) { MarkovRensa::Generator.new }

    context 'add_stringしてないとき' do
      it { is_expected.to be_empty }
    end

    context 'add_stringしたとき' do
      before do
        generator.add_string('メロスは激怒した。必ず、かの邪智暴虐の王を除かなければならぬと決意した。')
        generator.add_string('メロスには政治がわからぬ。メロスは、村の牧人である。')
        generator.add_string('笛を吹き、羊と遊んで暮して来た。けれども邪悪に対しては、人一倍に敏感であった。')
      end

      it { is_expected.not_to be_empty }
      it { is_expected.to be_a String }
    end
  end

  describe '#sentences' do
    let(:generator) { MarkovRensa::Generator.new }

    context '引数渡さなかった時' do
      subject { generator.sentences }

      it { is_expected.to be_a Array }
      it 'array size eq 1' do
        expect(subject.size).to eq 1
      end
    end

    context '引数渡した時' do
      subject { generator.sentences(arg) }
      let(:arg) { 3 }

      it { is_expected.to be_a Array }
      it 'array size eq arg' do
        expect(subject.size).to eq arg
      end
    end
  end
end
