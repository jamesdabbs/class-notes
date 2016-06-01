class Parser
  attr_reader :path
  
  def initialize path
    @path = path
  end

  def run
    puts "Parsing data from path: #{path}"
  end
end

Parser.new(__FILE__).run
