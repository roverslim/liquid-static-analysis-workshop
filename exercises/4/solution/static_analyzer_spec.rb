require_relative 'static_analyzer'

RSpec.describe(StaticAnalyzer, '.run') do
  subject { StaticAnalyzer.run(filename) }

  context 'when the document contains wellformed html and liquid' do
    let(:filename) { 'templates/wellformed_html_containing_liquid_comment.liquid' }
    it { is_expected.to be_empty }
  end

  context 'when the document contains malformed html and wellformed liquid' do
    let(:filename) { 'templates/malformed_html_and_wellformed_liquid_comment.liquid' }

    let(:analysis) do
      [
        {
          line_number: 3,
          parser: :html,
          type: :malformed_tag,
          message: 'DIV tag opened but never closed.',
        },
      ]
    end

    it { is_expected.to eq(analysis) }
  end

  context 'when the document contains wellformed html and malformed liquid' do
    let(:filename) { 'templates/wellformed_html_and_malformed_liquid_comment.liquid' }

    let(:analysis) do
      [
        {
          line_number: 5,
          parser: :liquid,
          type: :malformed_tag,
          message: 'Comment block opened but never closed.',
        },
      ]
    end

    it { is_expected.to eq(analysis) }
  end
end
