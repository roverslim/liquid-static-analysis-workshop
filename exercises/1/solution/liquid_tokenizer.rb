module LiquidTokenizer
  extend self

  PATTERNS = Regexp.union([
    /{%\s(?<type>end\w+)\s%}/,
    /{%\s(?<type>\w+)\s%}/,
  ]).freeze
  private_constant :PATTERNS

  def run(input)
    match_data = input.match(PATTERNS)
    return unless match_data

    case match_data[:type]
    when 'comment'
      ["comment", "open"]
    when 'endcomment'
      ["comment", "close"]
    end
  end
end
