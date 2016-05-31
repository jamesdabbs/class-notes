require 'pry'
require 'json'

require './data_parser'
require './transaction_parser'

p1 = TransactionParser.new "./data/transactions.json"
p1.parse!

transactions = p1.transactions

p2 = DataParser.new "./data/data.json"
p2.parse!

items = p2.items

# The user that made the most orders was __
counts = Hash.new 0
transactions.each do |t|
  user = t["user_id"]
  counts[ user ] += 1
end

# winner_id = nil
# winner_value = 0
# counts.each do |user_id, value|
#   if value > winner_value
#     winner_id = user_id
#     winner_value = value
#   end
# end
winner, value = counts.max_by { |user_id, count| count }


# We sold __ Ergonomic Rubber Lamps
# item_id = nil
# items.each do |i|
#   if i.name == "Practical Linen Keyboard"
#     item_id = i.id
#   end
# end

keyboard = items.find do |i|
  i.name == "Practical Linen Keyboard"
end

total = 0
transactions.each do |t|
  if t["item_id"] = keyboard.id
    total += t["quantity"]
  end
end

total2 = transactions.
  select { |t| t["item_id"] == keyboard.id }.
  map { |t| t["quantity"] }.
  reduce :+

binding.pry

# We sold __ items from the Tools category
# Our total revenue was __
# Harder: the highest grossing category was __

puts
