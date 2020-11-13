#  Destructive
def shout_out_to(name)
  name.upcase!

  puts 'HEY ' + name
end


#  Non-destructive
def shout_out_to(name)
  puts 'HEY ' + name.upcase
end

shout_out_to('you') # expected: 'HEY YOU'