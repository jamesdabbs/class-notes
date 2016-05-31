require "json"

class DataParser
  attr_reader :path, :users, :items

  def initialize path
    @path = path
    @users = []
    @items = []
  end

  def parse!
    raw = JSON.parse File.read path

    raw["users"].each do |hash|
      users.push User.new(
        hash["id"],
        hash["name"],
        hash["address"]
      )
    end

    raw["items"].each do |hash|
      items.push Item.new(
        hash["id"],
        hash["name"],
        hash["price"],
        hash["category"]
      )
    end
  end
end
