require 'faker'
require 'date'
require 'net/http'
require 'json'
require 'nokogiri'
require 'active_support/core_ext/hash'

# Method to seed fake data for app testing
def seed_user_data
  admin = User.new(username: "admin", email: "admin@admin.com", admin: true)
  admin.password = "admin"
  admin.save

  tom = User.new(username: "tomtom", email: "tom@tom.com")
  tom.password = "tomtom"
  tom.save

  tim = User.new(username: "timtom", email: "tim@tom.com")
  tim.password = "timtom"
  tim.save

  20.times do
    new_user = User.new(username: Faker::Internet.user_name)
    new_user.email = Faker::Internet.safe_email(new_user.username)
    new_user.password = "password"
    new_user.save
  end
end

def seed_test_game_data
  player_numbers = ["2-4", "2-6", "2", "4-8"]
  durationz = ["30-60", "120+", "60-90"]
  release_dates = ["2012", "1995", "2005", "2016"]

  8.times do
    Game.create(title: Faker::Zelda.game,
              description: Faker::HitchhikersGuideToTheGalaxy.quote,
              number_of_players: player_numbers.sample,
              duration: durationz.sample,
              release_date: release_dates.sample,
              designer: Faker::Zelda.character + " Games",
              image_url: "",
              image_thumbnail_url: ""
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
end

def seed_review_data
  20.times do
    Review.create(
      title: Faker::MostInterestingManInTheWorld.quote,
      body: Faker::Hacker.say_something_smart + " " + Faker::ChuckNorris.fact,
      game_id: Game.all.sample.id,
      author_id: User.all.sample.id)
  end
end


# Method to seed basic game data
def seed_real_games
  uri = URI("https://bgg-json.azurewebsites.net/collection/caristopmer200")

  json_string = Net::HTTP.get(uri)

  collection_array = JSON.parse(json_string)

  game_params_array = []
  collection_array.each do |game|
    game_args = {}
    game_args[:title] = game["name"]
    game_args[:description] = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    game_args[:number_of_players] = player_range(game)
    game_args[:duration] = game["playingTime"]
    game_args[:release_date] = game["yearPublished"].to_s
    game_args[:designer] = Faker::Zelda.character + " Games"
    game_args[:image_url] = game["image"]
    game_args[:image_thumbnail_url] = game["thumbnail"]
    game_args[:bgg_id] = game["gameId"]
    game_params_array << game_args
  end

  temp_games = []
  game_params_array.each do |params|
    temp_games << Game.create(params)
  end
end

def seed_desc_mechs_cats_designers
  games = Game.all
  game_ids = []
  games.each do |game|
    game_ids << game.bgg_id
  end

  game_ids.each do |game_id|
    uri = URI("https://bgg-json.azurewebsites.net/thing/#{game_id}")
    info_hash = JSON.parse(Net::HTTP.get(uri))

    current_game = Game.find_by(bgg_id: game_id)
    # description
    current_game[:description] = info_hash["description"].gsub(/&#10;/,"<br>")
    # mechs
    info_hash["mechanics"].each do |mechanic|
      current_game.mechanisms << Mechanism.find_or_create_by(name: mechanic)
    end
    # designer
    current_game[:designer] = info_hash["designers"][0]

    # categories
    uri = URI("https://boardgamegeek.com/xmlapi2/thing?id=#{game_id}")
    doc = Nokogiri::XML(Net::HTTP.get(uri))
    game_info_hash = Hash.from_xml(doc.to_s)
    links_array = game_info_hash["items"]["item"]["link"]

    links_array.each do |link|
      if link["type"] == "boardgamecategory"
        current_game.categories << Category.find_or_create_by(name: link["value"])
      end
    end

    current_game.save
    sleep(5)
  end
end

def player_range(game)
  return "#{game["maxPlayers"]}" if game["minPlayers"] == game["maxPlayers"]
  "#{game["minPlayers"]}-#{game["maxPlayers"]}"
end

def seed_200_games

end

def seed_10_games

end

#************************************
# Comment the methods below in or out depending on what you want to do.
 seed_user_data
# seed_test_game_data
 seed_real_games
 seed_review_data
 seed_desc_mechs_cats_designers
#************************************
