require_relative 'liquid_tokenizer'
require 'json'
require 'pry'

RSpec.describe(LiquidTokenizer, '.run') do
  subject { described_class.run(input) }

  context 'Example 1: when the input contains a valid comment opening' do
    let(:input) { File.read("example1.liquid") }
    let(:output) { JSON.parse(File.read("example1_output.json")) }
    it { is_expected.to eql(output) }
  end

  context 'Example 2: when the input contains a valid comment closing' do
    let(:input) { File.read("example2.liquid") }
    let(:output) { JSON.parse(File.read("example2_output.json")) }

    it { is_expected.to eql(output) }
  end

  context 'Example 3: when the input contains an invalid comment opening' do
    let(:input) { File.read("example3.liquid") }
    let(:output) { JSON.parse(File.read("example3_output.json")) }

    it { is_expected.to eql(output) }
  end

  context 'Example 4: when the input contains an invalid comment closing' do
    let(:input) { File.read("example3.liquid") }
    let(:output) { JSON.parse(File.read("example3_output.json")) }

    it { is_expected.to eql(output) }
  end

  context 'Example 5: when the input contains no tag block' do
    let(:input) { File.read("example3.liquid") }
    let(:output) { JSON.parse(File.read("example3_output.json")) }

    it { is_expected.to eql(output) }
  end
end
