require_relative 'liquid_tokenizer'

class LiquidParser
  def initialize(analyzer:)
    @analyzer = analyzer
    @ast = []
  end

  attr_reader :ast

  Tag = Struct.new(:line_start, :type, :body, :wellformed) do
    def close
      self.wellformed = true
    end

    def insert_body(input)
      self.body ||= ''
      self.body << input.to_s
    end
  end

  def run(line_number, line)
    type, action = LiquidTokenizer.run(line_number, line, @analyzer)

    case action
    when :open then open_tag(type, line_number)
    when :close then close_tag(type, line_number)
    else
      insert_body(line)
    end
  end

  def complete
    return unless @current

    @analyzer.add(
      line_number: @current.line_start,
      error: 'malformed_tag',
      message: "#{@current.type.capitalize} block opened but never closed.",
    )
  end

  private

  def open_tag(type, line_start)
    return if @current

    @current = Tag.new(line_start, type)
    @ast << @current
  end

  def close_tag(type, line_number)
    unless @current
      @analyzer.add(
        line_number: line_number,
        error: 'malformed_tag',
        message: "#{type.capitalize} block closing without a matching opening.",
      )
      return
    end

    @current.close
    @current = nil
  end

  def insert_body(input)
    return unless @current
    @current.insert_body(input)
  end
end
