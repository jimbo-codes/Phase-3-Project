class Price < ActiveRecord::Base
    belongs_to :coin

    #time of price, currency, price. -- Prolly volume + mkt cap too
    
end