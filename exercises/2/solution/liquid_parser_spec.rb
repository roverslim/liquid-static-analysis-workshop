require_relative 'liquid_parser'
require 'json'
require 'pry'

RSpec.describe(LiquidParser, '#run') do
  subject do
    parser = described_class.new

    file = File.new("../#{input_filename}")
    file.each_line do |line|
      parser.run(line)
    end

    JSON.parse(parser.to_json)
  end

  let(:expected_output) { JSON.parse(File.read("../#{expected_output_filename}")) }

  context 'Example 1: when the document contains a wellformed liquid comment' do
    let(:input_filename) { 'example1.liquid' }
    let(:expected_output_filename) { 'example1_output.json' }

    it { is_expected.to eq(expected_output) }
  end

  context 'Example 2: when the document contains a malformed liquid comment' do
    context 'when the opening comment tag contains a typo' do
      let(:input_filename) { 'example2.liquid' }
      let(:expected_output_filename) { 'example2_output.json' }

      it { is_expected.to eql(expected_output) }
    end

    context 'Example 3: when the closing comment tag is missing' do
      let(:input_filename) { 'example3.liquid' }
      let(:expected_output_filename) { 'example3_output.json' }

      it { is_expected.to eql(expected_output) }
    end
  end
end
