# puts "🌱 Seeding Users..."

# User.create(username: "james", password: "password")
# User.create(username: "james11", password: "password123")

# puts "🌱 Seeding Portfolios..."
# Portfolio.create(user_id: "1", created_at: "11/1/2020")

puts "🌱 Not Seeding Coins..."

puts "🌱 Seeding User_coins..."
Usercoin.create(coin_id: "1", user_id: "1")
Usercoin.create(coin_id: "2", user_id: "1")
Usercoin.create(coin_id: "2", user_id: "2")
# puts "🌱 Seeding Prices..."

puts "✅ Done seeding!"
