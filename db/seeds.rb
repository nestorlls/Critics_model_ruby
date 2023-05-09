require 'faker'
require 'json'

puts 'Destroying all data'
Critic.destroy_all
User.destroy_all
Game.destroy_all

# create 10 random users usin Faker (you can use Faker::Name, Faker::Internet and Faker::Date)
puts "Start seeding Users"
10.times do
  user = User.find_or_create_by(
    username: Faker::Internet.unique.username(specifier: 8),
    email: Faker::Internet.unique.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 70)
  )

  if !user.persisted?
    puts user.errors.full_messages
    puts user
  end
end
puts "Finish seeding Users"

# Create all the games from JSON file
puts "Start seeding Games"
  games = JSON.parse(File.read('db/games.json'), symbolize_names: true)
  games.each do |game_data|
    game = Game.find_or_create_by(game_data)

    if !game.persisted?
      puts game.errors.full_messages
      p game
    end
  end
puts "Finish seeding Games"

# For each game, create between 1 and 3 critics from random users (you can use Faker::Lorem)
puts "Start seeding Critics"
  games = Game.all
  games.each do |game|
    users = User.all.to_a
    rand(1..3).times do
      user = users.sample
      critic = Critic.find_or_create_by(
        title: Faker::Lorem.sentence,
        body: Faker::Lorem.paragraph,
        game_id: game.id,
        user_id: user.id,
      )

      users.delete(user)

      if !critic.persisted?
        critic.errors.full_messages
        p critic
      end
    end
  end
puts "Finish seeding Critics"