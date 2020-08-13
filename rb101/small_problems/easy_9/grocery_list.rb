def buy_fruit(arr)
  basket = []
  arr.each do |item|
    fruit, quantity = item[0], item[1]
    quantity.times {basket << fruit}
  end
  basket
end