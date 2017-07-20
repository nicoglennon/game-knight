require 'net/http'
require 'json'

uri = URI("https://bgg-json.azurewebsites.net/collection/caristopmer")

json_string = Net::HTTP.get(uri)

collection_array = JSON.parse(json_string)

def player_range(game)
  "#{game["maxPlayers"]}" if game["minPlayers"] == game["maxPlayers"]
  "#{game["minPlayers"]}-#{game["maxPlayers"]}"
end

game_params_array = []
collection_array.each do |game|
  game_args = {}
  game_args[:title] = game["name"]
  game_args[:number_of_players] = player_range(game)
  game_args[:duration] = game["playingTime"]
  game_args[:release_date] = game["yearPublished"].to_s
  game_args[:image_url] = game["image"]
  game_args[:image_thumbnail_url] = game["thumbnail"]
  game_args[:bgg_id] = game["gameId"]
  game_params_array << game_args
end

p game_params_array

temp_games = []
game_params_array.each do |params|
  temp_games << Game.new(params)
end

p temp_games
