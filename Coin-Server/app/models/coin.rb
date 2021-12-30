class Coin < ActiveRecord::Base
    # has_many :prices
    has_many :usercoins
    has_many :users, through: :usercoins

# you gotta say the other belong?
    # Start with a single fetch, figure out the timer later
    # (with error handling for 400 type responses)
end