require 'pry'

class Parser
  attr_reader :path, :string

  def initialize path: nil, url: nil
    # if path
    #   @contents = JSON.parse File.read path
    # else
    #   @contents = HTTParty.get url
    # end
    @path = path
    @string = string
  end

  def run
    if path
      puts "Parsing data from path: #{path}"
      puts File.read path
    elsif string
      puts "Using raw string"
      puts string
    end
  end
end

Parser.new(path: __FILE__, string: "Not used").run
Parser.new(string: "Here's a string").run
