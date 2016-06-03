require "httparty"
require "pry"

#"http://api.wunderground.com/api/#{Wunderground_key}/geolookup/conditions/q/#{Zipcode}.json"

key = "[REDACTED]"
zipcode = 27610
r = HTTParty.get(
  "http://api.wunderground.com/api/#{key}/forecast10day/q/#{zipcode}.json"
  #"http://api.wunderground.com/api/#{key}/planner_06020602/q/27703.json"
)

# Planner endpoint
# r["trip"]["chance_of"]["chanceofprecip"]["percentage"]
# r["trip"]["temp_high"]["avg"]["F"]
# r["trip"]["temp_low"]["avg"]["F"]

# Forecast endpoint
# r["forecast"]["simpleforecast"]["forecastday"].first["high"]

binding.pry
puts
