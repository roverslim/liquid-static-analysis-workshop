require_relative 'liquid_parser'

RSpec.describe(LiquidParser, '#run') do
  let(:parser) { LiquidParser.new }

  subject do
    document.each do |line|
      parser.run(line)
    end
    parser.ast
  end

  context 'when the document contains a wellformed liquid comment' do
    let(:document) do
      [
        '{% comment %}',
        'This is a comment',
        '{% endcomment %}',
      ]
    end

    let(:ast) { [LiquidParser::Tag.new(:comment, 'This is a comment', true)] }

    it { is_expected.to eq(ast) }
  end

  context 'when the document contains a malformed liquid comment' do
    context 'when the opening comment tag contains a typo' do
      let(:document) do
        [
          '{% coment %}',
          'This is a comment',
          '{% endcomment %}',
        ]
      end

      it { is_expected.to be_empty }
    end

    context 'when the closing comment tag is missing' do
      let(:document) do
        [
          '{% comment %}\n',
          'This is a comment\n',
          '<div>',
        ]
      end

      let(:ast) { [LiquidParser::Tag.new(:comment, 'This is a comment\n<div>', nil)] }

      it { is_expected.to eq(ast) }
    end
  end
end
