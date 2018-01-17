require_relative 'liquid_tokenizer'

RSpec.describe(LiquidTokenizer, '.run') do
  subject { LiquidTokenizer.run(input) }

  context 'when the input contains a valid comment opening' do
    let(:input) { '{% comment %}' }
    it { is_expected.to match_array([:comment, :open]) }
  end

  context 'when the input contains an invalid comment opening' do
    let(:input) { '{% coment %}' }
    it { is_expected.to be_nil }
  end

  context 'when the input contains a valid comment closing' do
    let(:input) { '{% endcomment %}' }
    it { is_expected.to match_array([:comment, :close]) }
  end

  context 'when the input contains an invalid comment closing' do
    let(:input) { '{% endcoment %}' }
    it { is_expected.to be_nil }
  end

  context 'when the input contains no tag block' do
    let(:input) { 'This is a comment' }
    it { is_expected.to be_nil }
  end
end
