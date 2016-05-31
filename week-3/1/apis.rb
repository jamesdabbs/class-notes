require 'httparty'
require 'pry'

require './token'

def get_repos page_number
  HTTParty.get(
    "https://api.github.com/users/jamesdabbs/repos?page=#{page_number}",
    # query: {
    #   page: 2
    # },
    headers: {
      "Authorization" => "token #{Token}",
      "User-Agent" => "microsoft wandows"
    }
  )
end

def update_repo_description text
  body = {
    name: "class-notes",
    description: text
  }.to_json

  HTTParty.patch(
    "https://api.github.com/repos/tiyd-ror-2016-06/class-notes",
    headers: {
      "Authorization" => "token #{Token}",
      "User-Agent" => "microsoft wandows"
    },
    body: body
  )
end

r = get_repos 1
if r.code == 200
  puts "You have #{r.count} repos (on this page)"
else
  time = r.headers["x-ratelimit-reset"]
  time = Time.at time.to_i
  puts "Out of rate limit, try again at #{time}"
  exit
end

name = r.first["name"]
puts "The first one on the first page is: #{name}"

r = get_repos 2
name = r.first["name"]
puts "The first one on the second page is: #{name}"

r = update_repo_description "The Fightin' Aardwolves"
binding.pry


puts
