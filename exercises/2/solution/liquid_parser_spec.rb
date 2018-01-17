require_relative 'liquid_parser'

RSpec.describe(LiquidParser, '#run') do
  let(:parser) { LiquidParser.new }

  subject do
    document.each do |line|
      parser.run(line)
    end
    parser.ast
  end

  context 'when the document contains a well formed liquid comment' do
    let(:document) do
      [
        '{% comment %}',
        'This is a comment',
        '{% endcomment %}',
      ]
    end

    let(:ast) do
      [LiquidParser::Tag.new(:comment, 'This is a comment', true)]
    end

    it { is_expected.to eq(ast) }
  end
end
