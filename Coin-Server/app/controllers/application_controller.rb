require 'open-uri'
require 'net/http'
require 'json'

class ApplicationController < Sinatra::Base
  # set :default_content_type, 'application/json'

  configure do
    set :public_folder, 'public'
    set :views, 'app/views' 
    enable :sessions
    set :sessions, true
		set :session_secret, ENV['SESSION_SECRET']
    # use Rack::Flash
  end 

  get "/coins" do
    # set :default_content_type, 'application/json'
    content_type :json
    url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd"
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    parsedobj = JSON.parse(response.body)
      parsedobj.each do |coin|
        if !Coin.find_by(coin_symbol: coin['symbol'])
          Coin.create(
            current_price: coin['current_price'], 
            market_cap: coin['market_cap'], 
            coin_symbol: coin['symbol'], 
            update_time: coin['last_updated'],
            total_supply: coin['total_supply'],
            max_supply: coin['max_supply'], 
            coin_name: coin['name'], 
            coin_image: coin['image'],
            coin_id: coin['id'],
            price_chg: coin['price_change_percentage_24h'],
            market_rank: coin['market_cap_rank'],
            volume: coin['total_volume']
          )
        end
      end
    response.body
  end

  post '/usercoins' do
    
    ### CONFIRM THAT IT ISNT IN USERS PORTFOLIO already

    coin = Coin.find_by coin_id: params[:id]
    new_port = Usercoin.new(coin_id: coin.id, user_id: params[:user])
    new_port.save
    new_port.to_json
  end

  get '/usercoins/:user_id' do
    # binding.pry
    user = User.find_by username: params[:user_id]
    #Write an instance method to return the user's portfolio coins
    user.portfolioCoins.to_json
  end

  delete '/usercoins/:id' do
# binding.pry
# YOU"RE DELETING THE ACTUAL COINS IN DATABASE.

    del = Coin.find_by coin_id: params[:id]
    delete = Usercoin.find_by coin_id: del.id

    # binding.pry
    delete.destroy
    delete.to_json
  end
# creating the portfolio
end
