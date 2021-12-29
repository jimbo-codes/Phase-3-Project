class Coin < ActiveRecord::Base
    # need stock table + seed
    belongs_to :portfolio

    # Start with a single fetch, figure out the timer later
    # (with error handling for 400 type responses)
end