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
            coin_image: coin['image'])
        end
      end
    response.body
  end

  post '/usercoins' do
    new_port = Usercoin.create(

      ## Do user authentication first to use session ID for user ID
      ## Then have your click event reference + lookup the 

      #use params to reference the thing that will let you lookup which coin this is

      #have the current user saved in var + set on the login

      #take the onclick thing, and seach it in your DB (can use db_ID field)
      # Then return the database ID
      #coin ID and User ID
    )
  end

  delete '/usercoins/:id' do
    del = Usercoin.find(params[:id])
    del.destroy
    del.to_json
  end
# creating the portfolio
end
