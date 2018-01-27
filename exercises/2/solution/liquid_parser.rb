require_relative '../../1/solution/liquid_tokenizer'
require 'json'

class LiquidParser
  def initialize
    @ast = []
  end

  attr_reader :ast

  Tag = Struct.new(:type, :body, :wellformed) do
    def close
      self.wellformed = true
    end

    def insert_body(input)
      self.body ||= ''
      self.body << input.to_s
    end

    def as_json
      {
        type: type,
        body: body,
        wellformed: wellformed || false,
      }
    end
  end

  def run(input)
    type, action = LiquidTokenizer.run(input.lstrip)

    case action
    when "open" then open_tag(type)
    when "close" then close_tag(type)
    else
      insert_body(input.lstrip)
    end
  end

  def to_json(*args)
    JSON.pretty_generate ast.map(&:as_json)
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
