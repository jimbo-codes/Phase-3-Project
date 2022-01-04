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
        session[:user_id] = user.id # This logs you in
        user.id.to_json

        ## SET YOUR SESSION THING HERE
        end
    end

    #login '/login' (acts like "read")
    post '/login' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
        end
        binding.pry
        # if exist + pw is correct
            # then login
        #else say invalid login.
    end


    # log out '/logout' (acts like delete, clears session)

end