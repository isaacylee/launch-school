# Input: odd integer, n
# Output: display a diamond in a 'n' x 'n' grid

# diamond(1) = [1]
# diamond(3) = [1, 3, 1]
# diamond(5) = [1, 3, 5, 3, 1]

def stars_in_each_line(odd_integer)
  top_half = []

  1.upto(odd_integer) do |num|
    next if num.even?
    top_half << num
  end

  bottom_half = top_half[0..-2].reverse

  top_half + bottom_half
end

def display_diamond(arr, integer)
  arr.each do |times|
    puts ('*' * times).center(integer)
  end
end

def diamond(odd_integer)
  arr = stars_in_each_line(odd_integer)
  display_diamond(arr, odd_integer)
end

# further exploration

def display_diamond_fe(arr, integer)
  arr.each do |row|
    case row
    when 1 then puts "*".center(integer)
    else        puts ("*" + "#{' ' * (row - 2)}" + "*").center(integer)
    end
  end
end

def diamond_fe(odd_integer)
  arr = stars_in_each_line(odd_integer)
  display_diamond_fe(arr, odd_integer)
end