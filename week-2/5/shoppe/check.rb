require "pry"

require "./item"
require "./user"
require "./data_parser"
require "./transaction_parser"

tp = TransactionParser.new "./data/transactions.json"
tp.parse!

dp = DataParser.new "./data/data.json"
dp.parse!

# Which users made the most orders?
counts = Hash.new 0
tp.transactions.each do |t|
  counts[ t["user_id"] ] += 1
end
user = counts.max_by { |user, count| count }.first
puts "User id #{user} had the most orders"

# How many Ergonomic Rubber Lamps were sold?
item = dp.items.find { |i| i.name == "Ergonomic Rubber Lamp" }
count = tp.transactions.count { |t| t["item_id"] == item.id }
puts "#{count} ERLs"

# How many Tools were sold?
items = dp.items.select { |i| i.category.downcase.include? "tools" }
item_ids = items.map { |i| i.id }
count = tp.transactions.count { |t| item_ids.include? t["item_id"] }
puts "#{count} Tools"

# What was the total revenue?
total = 0
tp.transactions.each do |t|
  item = dp.items.find { |i| i.id == t["item_id"] }
  total += t["quantity"] * item.price
end
puts "Total revenue is #{total}"
