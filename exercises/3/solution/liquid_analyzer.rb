require_relative 'liquid_parser'

module LiquidAnalyzer
  extend self

  class Analysis < Struct.new(:output)
    def initialize
      self.output = []
    end

    def add(line_number:, error:, message:)
      self.output << {
        'line_number' => line_number,
        'error' => error,
        'message' => message,
      }
    end
  end
  private_constant :Analysis

  def run(filename)
    analysis = Analysis.new
    parser = LiquidParser.new(filename, analyzer: analysis)
    parser.run
    analysis.output
  end
end
