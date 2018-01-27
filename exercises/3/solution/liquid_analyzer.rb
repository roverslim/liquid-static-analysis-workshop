require_relative 'liquid_parser'

class LiquidAnalyzer
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

  def initialize(filename)
    @file = File.new(filename)
  end

  def run
    analysis = Analysis.new

    parser = LiquidParser.new(analyzer: analysis)
    @file.each do |line|
      line_number = @file.lineno
      parser.run(line_number, line)
    end
    parser.complete

    analysis.output
  end
end
