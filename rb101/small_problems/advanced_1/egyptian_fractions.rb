# egyptian: Rational number => Array of denominators

# unegyptian: Array of denominators => Rational number

def egyptian(rational_num)
  denominators = []
  test_denom = 1
  current_value = 0

  while current_value < rational_num
    if current_value + Rational(1, test_denom) <= rational_num
      denominators << test_denom
      current_value += Rational(1, test_denom)
    end

    test_denom += 1
  end

  denominators
end

def unegyptian(array)
  array.map { |denom| Rational(1, denom) }.sum
end
