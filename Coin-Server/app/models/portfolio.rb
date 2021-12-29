class Portfolio < ActiveRecord::Base
    # need portfolio table + seed
    has_many :coins
    belongs_to :user

    # this is the list of STOCKS that are in this specific users port
end