require "pry"

def add_a_thing_to_an_array array
  array.push rand(1 .. 10)
end

r = []
add_a_thing_to_an_array r
add_a_thing_to_an_array r
add_a_thing_to_an_array r
add_a_thing_to_an_array r
add_a_thing_to_an_array r
old_r = r

r = []
add_a_thing_to_an_array r
add_a_thing_to_an_array r

binding.pry
