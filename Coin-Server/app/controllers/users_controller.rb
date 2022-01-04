require 'pry'

class UsersController < ApplicationController

    # YOU WILL NEED TO SET THE USER SESSION = USER ID

    #we don't have a get signup because that display handled in react.

    post '/signup' do
        if User.find_by(username: params[:username])
            status 401
            {error: "This user already exists"}.to_json
            # you passed this error into your react app, and referenced that to show the message.
        else
        #else redirect to signup page and implement flash error msg
        user = User.create(params)
        "Success".to_json
        # status 200
        # status 200, body: 'User Created!'.to_json
            # binding.pry
        
            ### WHATEVER YOU DO TO PUSH LOGIN THROUGH SHOULD GO HERE.
        end
    end

    #login '/login' (acts like "read")


    # log out '/logout' (acts like delete, clears session)

end