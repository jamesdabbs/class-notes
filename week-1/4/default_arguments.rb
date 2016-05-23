def hello whatever=nil
  # if you call this with an argument, `whatever` will be what you pass in
  # if you don't pass an argument, this will just set `whatever` to `nil`
  #   instead of erroring
  if whatever
    puts "Hello, #{whatever}"
  else
    puts "Hello, World"
  end
end

hello "Class" # prints "Hello, Class"
hello         # prints "Hello, World"

# or, equivalently

def hello whatever="World"
  # now, if you call `hello` without passing in an argument, `whatever`
  # will be set to "World"
  puts "Hello, #{whatever}"
end
