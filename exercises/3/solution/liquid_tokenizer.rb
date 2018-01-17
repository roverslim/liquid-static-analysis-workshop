module LiquidTokenizer
  extend self

  PATTERNS = Regexp.union([
    /{%\s(?<type>end\w+)\s%}/,
    /{%\s(?<type>\w+)\s%}/,
  ]).freeze
  private_constant :PATTERNS

  def run(line_number, input, analysis)
    match_data = input.match(PATTERNS)
    return unless match_data

    type = match_data[:type]
    case type
    when 'comment'
      [:comment, :open]
    when 'endcomment'
      [:comment, :close]
    else
      analysis.add(
        line_number: line_number,
        type: :unknown_tag_type,
        message: "Unrecognized tag type #{type.inspect}.",
      )
      nil
    end
  end
end
