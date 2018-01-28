require_relative 'liquid_tokenizer'
require 'json'
require 'pry'

RSpec.describe(LiquidTokenizer, '.run') do
  subject { described_class.run(input) }

  let(:input) { File.read("../#{input_filename}") }
  let(:expected_output) { JSON.parse(File.read("../#{expected_output_filename}")) }

  context 'Example 1: when the input contains a valid comment opening' do
    let(:input_filename) { 'example1.liquid' }
    let(:expected_output_filename) { 'example1_output.json' }

    it { is_expected.to eql(expected_output) }
  end

  context 'Example 2: when the input contains a valid comment closing' do
    let(:input_filename) { 'example2.liquid' }
    let(:expected_output_filename) { 'example2_output.json' }

    it { is_expected.to eql(expected_output) }
  end

  context 'Example 3: when the input contains an invalid comment opening' do
    let(:input_filename) { 'example3.liquid' }
    let(:expected_output_filename) { 'example3_output.json' }

    it { is_expected.to eql(expected_output) }
  end

  context 'Example 4: when the input contains an invalid comment closing' do
    let(:input_filename) { 'example4.liquid' }
    let(:expected_output_filename) { 'example4_output.json' }

    it { is_expected.to eql(expected_output) }
  end

  context 'Example 5: when the input contains no tag block' do
    let(:input_filename) { 'example5.liquid' }
    let(:expected_output_filename) { 'example5_output.json' }

    it { is_expected.to eql(expected_output) }
  end
end
