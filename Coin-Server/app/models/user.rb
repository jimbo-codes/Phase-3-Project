class User < ActiveRecord::Base
    # has_one :portfolio
    has_many :usercoins
    has_many :coins, through: :usercoins

# any type of user / security verification may want to live here.

end