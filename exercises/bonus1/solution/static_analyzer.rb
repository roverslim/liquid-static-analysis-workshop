require_relative '../../3/solution/liquid_parser'
require_relative 'html_parser'

module StaticAnalyzer
  extend self

  class Analysis < Struct.new(:output)
    def initialize
      self.output = []
    end

    def add(line_number:, parser:, type:, message:)
      self.output << {
        line_number: line_number,
        parser: parser,
        type: type,
        message: message,
      }
    end
  end
  private_constant :Analysis

  def run(filename)
    analysis = Analysis.new

    liquid_parser = LiquidParser.new(filename, analyzer: analysis)
    liquid_parser.run

    if analysis.output.empty?
      html_parser = HtmlParser.new(filename, analyzer: analysis)
      html_parser.run
    end

    analysis.output
  end
end
