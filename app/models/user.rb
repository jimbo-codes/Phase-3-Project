class User < ActiveRecord::Base
    # here define ther relationships
    has_one :portfolio
end