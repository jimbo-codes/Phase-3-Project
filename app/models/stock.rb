class Stock < ActiveRecord::Base
    belongs_to :portfolio

    # Start with a single fetch, figure out the timer later
    # (with error handling for 400 type responses)
end