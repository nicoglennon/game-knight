require 'faker'
require 'date'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

player_numbers = ["2-4", "2-6", "2", "4-8"]
durationz = ["30-60", "120+", "60-90"]

8.times do
  Game.create(title: Faker::Zelda.game,
            description: Faker::HitchhikersGuideToTheGalaxy.quote,
            number_of_players: player_numbers.sample,
            duration: durationz.sample,
            release_date: Date.today,
            publisher: Faker::Zelda.character + " Games",
            image_url: ""
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
