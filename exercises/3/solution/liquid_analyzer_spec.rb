require_relative 'liquid_analyzer'

RSpec.describe(LiquidAnalyzer, '.run') do
  subject { LiquidAnalyzer.run(filename) }

  context 'when the document contains a wellformed liquid comment' do
    let(:filename) { 'example1.liquid' }
    it { is_expected.to be_empty }
  end

  context 'when the document contains a malformed liquid comment' do
    context 'when the opening comment tag contains a typo' do
      let(:filename) { 'example2.liquid' }
      let(:analysis) do
        [
          {
            line_number: 1,
            type: :unknown_tag_type,
            message: 'Unrecognized tag type "coment".',
          },
          {
            line_number: 3,
            type: :malformed_tag,
            message: 'Comment block closing without a matching opening.',
          },
        ]
      end

      it { is_expected.to eq(analysis) }
    end

    context 'when the closing comment tag is missing' do
      let(:filename) { 'example3.liquid' }
      let(:analysis) do
        [
          {
            line_number: 1,
            type: :malformed_tag,
            message: 'Comment block opened but never closed.',
          },
        ]
      end

      it { is_expected.to eq(analysis) }
    end
  end
end
