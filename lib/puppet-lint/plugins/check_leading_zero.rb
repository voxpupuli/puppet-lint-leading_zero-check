PuppetLint.new_check(:leading_zero) do
  def check
    tokens.each do |token|
      next unless token.type == :NUMBER and token.value =~ /^0\d/

      notify :warning, {
        message: 'unquoted number with leading zero',
        line: token.line,
        column: token.column,
        token: token,
      }
    end
  end

  def fix(problem)
    problem[:token].type = :SSTRING
  end
end
