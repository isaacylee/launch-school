def sum(n)
  return 1 if n == 1
  return 1 if n == 2
  sum(n - 1) + sum(n - 2)
end
