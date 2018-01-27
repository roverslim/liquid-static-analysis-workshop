require_relative 'liquid_analyzer'
require 'json'
require 'pry'

RSpec.describe(LiquidAnalyzer, '.run') do
  subject { LiquidAnalyzer.new(filename).run }

  context 'when the document contains a wellformed liquid comment' do
    let(:filename) { 'example1.liquid' }
    let(:expected_output) do
      JSON.parse(File.read("example1_output.json"))
    end
    it { is_expected.to eq(expected_output) }
  end

  context 'when the document contains a malformed liquid comment' do
    context 'when the closing comment tag is missing' do
      let(:filename) { 'example2.liquid' }

      let(:expected_output) do
        JSON.parse(File.read("example2_output.json"))
      end

      it { is_expected.to eq(expected_output) }
    end

    context 'when the opening comment tag contains a typo' do
      let(:filename) { 'example3.liquid' }

      let(:expected_output) do
        JSON.parse(File.read("example3_output.json"))
      end

      it { is_expected.to eq(expected_output) }
    end
  end
end
