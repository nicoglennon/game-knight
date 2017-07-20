require 'faker'
require 'date'
require 'net/http'
require 'json'

# Comment the methods below in or out depending on what you want to do.
seed_test_data
seed_games

# Method to seed fake data for app testing
def seed_test_data
  tom = User.new(username: "tomtom", email: "tom@tom.com")
  tom.password = "tomtom"
  tom.save

  tim = User.new(username: "timtim", email: "tim@tim.com")
  tim.password = "timtim"
  tim.save


  player_numbers = ["2-4", "2-6", "2", "4-8"]
  durationz = ["30-60", "120+", "60-90"]
  release_dates = ["2012", "1995", "2005", "2016"]

  8.times do
    Game.create(title: Faker::Zelda.game,
              description: Faker::HitchhikersGuideToTheGalaxy.quote,
              number_of_players: player_numbers.sample,
              duration: durationz.sample,
              release_date: release_dates.sample,
              publisher: Faker::Zelda.character + " Games"
              )
  end

  10.times { Category.create(name: Faker::Food.dish) }

  10.times { Mechanism.create(name: Faker::Food.spice) }

  10.times do
    GameMechanism.create(game_id: Game.all.sample.id, mechanism_id: Mechanism.all.sample.id)
  end

  10.times do
    GameCategory.create(game_id: Game.all.sample.id, category_id: Category.all.sample.id)
  end

  15.times do
    Review.create(
      title: Faker::MostInterestingManInTheWorld.quote,
      body: Faker::Hacker.say_something_smart + " " + Faker::ChuckNorris.fact,
      game_id: Game.all.sample.id,
      author_id: User.all.sample.id)
  end
end


# Method to seed basic game data
def seed_games
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

  temp_games = []
  game_params_array.each do |params|
    temp_games << Game.new(params)
  end

  p temp_games
end

def player_range(game)
  "#{game["maxPlayers"]}" if game["minPlayers"] == game["maxPlayers"]
  "#{game["minPlayers"]}-#{game["maxPlayers"]}"
end
