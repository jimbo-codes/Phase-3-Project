class User < ActiveRecord::Base
    has_secure_password
    # This SALT's our password, putting the user password into a random string to make decryption difficult
    validates :username, presence: true, uniqueness: true
    has_many :usercoins
    has_many :coins, through: :usercoins

# any type of user / security verification may want to live here.

end