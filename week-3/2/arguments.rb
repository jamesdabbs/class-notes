require 'pry'

class Parser
  attr_reader :path, :string

  def initialize options
    @path = options[:path]
    @string = options[:string]
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

Parser.new(path: __FILE__).run
Parser.new(string: "Here's a string").run
