require "httparty"
require "pry"

Token = ENV["GITHUB_TOKEN"]

class Pager
  include Enumerable

  def initialize url, max_pages
    @buffer = []
    @url, @max_pages = url, max_pages
    @page_fetches = 0
  end

  def each &block
    until @page_fetches == @max_pages
      if @buffer.empty?
        get_more_stuff
      end
      block.call @buffer.shift
    end
  end

  def get_more_stuff
    puts "Getting more stuff"
    response = HTTParty.get @url,
      headers: {
        "Authorization" => "bearer #{Token}",
        "User-Agent"    => "aardwolf"
      }
    @page_fetches += 1
    @buffer += response
  end
end

p = Pager.new "https://api.github.com/repos/rails/rails/commits", 2
shas = p.map { |commit| commit["sha"] }

# most_active = p.
#   group_by { |c| c["commit"]["author"] }.
#   max_by   { |author, commits| commits.count }

binding.pry
puts
