require 'pry'

class UsersController < ApplicationController
    enable :sessions
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
        user.id.to_json #sends UID back to frontend (in case you need)
        end
    end

    #login '/login' (acts like "read")
    post '/login' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            user.id.to_json
            # binding.pry
        else
            status 401
            {error: "Invalid Username or Password."}.to_json
        end
    end

    post '/sign_out' do
        #here IF your session ID = user ID then logout
        session.clear
        {result: "logged out"}.to_json
        # binding.pry
    end
    # log out '/logout' (acts like delete, clears session)

end