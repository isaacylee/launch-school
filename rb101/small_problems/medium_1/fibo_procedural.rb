def fibonacci(n)
  a = 1
  b = 1

  (n - 2).times do
    a, b = [b, a + b]
  end

  b
end
