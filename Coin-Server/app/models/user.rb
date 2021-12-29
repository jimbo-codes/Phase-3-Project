class User < ActiveRecord::Base
    # Already have user table
    has_one :portfolio
end