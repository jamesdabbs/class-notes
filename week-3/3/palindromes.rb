require 'pry'

def is_palindrome? string
  0.upto(string.length - 1) do |i|
    if string[i] != string[string.length - i - 1]
      return false
    end
  end
  return true
end

def describe string
  if is_palindrome? string
    puts "'#{string}' is a palindrome"
  else
    puts "'#{string}' is not a palindrome"
  end
end

describe "racecar"
describe "palindrome"
describe "somanydynamos"
