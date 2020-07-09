def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

# Further exploration
def power(num, pow)
  product = 1
  pow.times{ product = multiply(product, num) }
  product
end
