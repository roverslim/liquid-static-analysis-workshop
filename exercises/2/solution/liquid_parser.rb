require_relative '../../1/solution/liquid_tokenizer'

class LiquidParser
  def initialize
    @ast = []
  end

  attr_reader :ast

  Tag = Struct.new(:type, :body, :wellformed) do
    def wellformed?
      !!wellformed
    end

    def close
      self.wellformed = true
    end

    def insert_body(input)
      self.body ||= ''
      self.body << input.to_s
    end
  end

  def run(input)
    type, action = LiquidTokenizer.run(input)

    case action
    when :open then open_tag(type)
    when :close then close_tag(type)
    else
      insert_body(input)
    end
  end

  private

  def open_tag(type)
    return if @current

    @current = Tag.new(type)
    @ast << @current
  end

  def close_tag(type)
    return unless @current

    @current.close
    @current = nil
  end

  def insert_body(input)
    return unless @current
    @current.insert_body(input)
  end
end
