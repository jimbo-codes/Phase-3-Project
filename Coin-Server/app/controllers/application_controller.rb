class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # ToDo List:
    # class and db relationships:
    #   create tables
    #   seed your db

  # Add your routes here -- for the post, patch, del, etc.
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

end
