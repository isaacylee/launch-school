def fibonacci(n)
  a = 1
  b = 1

  (n - 2).times do
    a, b = [b, a + b]
  end

  b
end

def fibonacci_last(n)
  nth_fibonacci_num = fibonacci(n)
  nth_fibonacci_num.to_s[-1].to_i
end