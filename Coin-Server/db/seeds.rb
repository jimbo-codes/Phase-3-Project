puts "🌱 Seeding Users..."

User.create(username: "james", password: "password")
User.create(username: "james11", password: "password123")

# puts "🌱 Seeding Portfolios..."
# Portfolio.create(user_id: "1", created_at: "11/1/2020")

puts "🌱 Seeding Coins..."
Coin.create(current_price: 1000.50, market_cap: 10000, coin_symbol: "JRM", update_time: "2018-03-10T20:17:46.384Z", total_supply: 100, max_supply: 200, coin_name: "Jimcoin", coin_image: "none")
Coin.create(current_price: 5000.25, market_cap: 100, coin_symbol: "JIM", update_time: "2011-08-12T20:17:46.384Z", total_supply: 0, max_supply: 1, coin_name: "fakoin", coin_image: "none")

puts "🌱 Seeding User_coins..."
Usercoin.create(coin_id: "1", user_id: "1")
Usercoin.create(coin_id: "2", user_id: "1")
Usercoin.create(coin_id: "2", user_id: "2")
# puts "🌱 Seeding Prices..."

puts "✅ Done seeding!"
