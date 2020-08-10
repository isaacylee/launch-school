# Replace all non alphabetic characters with a space
# There should only be one space in a row

def cleanup(str)
  str.gsub(/[^a-z]/, " ").gsub(/ {2,}/, " ")
end