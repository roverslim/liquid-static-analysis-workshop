require_relative 'liquid_parser'
require 'json'
require 'pry'

RSpec.describe(LiquidParser, '#run') do
  let(:parser) { LiquidParser.new }

  subject do
    expected_input.each_line do |line|
      parser.run(line)
    end

    JSON.parse(parser.to_json)
  end

  context 'when the document contains a wellformed liquid comment' do
    let(:expected_input) do
      File.read("example1.liquid")
    end

    let(:expected_output) do
      JSON.parse(File.read("example1_output.json"))
    end

    it { is_expected.to eq(expected_output) }
  end

  context 'when the document contains a malformed liquid comment' do
    context 'when the opening comment tag contains a typo' do
      let(:expected_input) do
        File.read("example2.liquid")
      end

      let(:expected_output) do
        JSON.parse(File.read("example2_output.json"))
      end

      it { is_expected.to eql(expected_output) }
    end

    context 'when the closing comment tag is missing' do
      let(:expected_input) do
        File.read("example3.liquid")
      end

      let(:expected_output) do
        JSON.parse(File.read("example3_output.json"))
      end

      it { is_expected.to eql(expected_output) }
    end
  end
end
