def merge(arr1, arr2)
  merged = arr1 + arr2
  merged.uniq
end
  

def merge2(arr1, arr2)
  arr1 | arr2
end

def merge3(arr1, arr2)
  arr1.union(arr2)
end