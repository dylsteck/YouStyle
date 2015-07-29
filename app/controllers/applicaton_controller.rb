require_relative "../../config/environment"
# require_relative "../models/tweet.rb"
# require_relative "../models/user.rb"
class ApplicationController < Sinatra::Base
  
  set :views, "app/views"
  set :public, "public"
	
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
		enable :sessions
    set :session_secret, "clothing_site"
  end
	
	get'/' do
		erb :index
  end
  