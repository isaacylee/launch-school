# 2 sorted arrays => 1 array in sorted order.

def merge(arr1, arr2)
  result = []

  x = arr1.clone
  y = arr2.clone
 
  until x.empty? && y.empty?
    if x.empty?
      result << y.shift
    elsif y.empty?
      result << x.shift
    elsif x.first > y.first
      result << y.shift
    else
      result << x.shift
    end
  end

  result

end


arr1 = [1, 5, 9]
arr2 = [2, 6, 8]

