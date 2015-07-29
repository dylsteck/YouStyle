require_relative "../../config/environment"
# require_relative "../models/tweet.rb"
 require_relative "../models/user.rb"
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
		 if session[:user_id] == nil
			erb :index
		 else
			 erb :account
    end
  end
	get'/signup' do
		erb :signup
  end
	post '/signup' do
		@newuser = User.new ({:username => params[:username], :gender => params[:gender], :password => params[:password]})
		@users = User.all
	@newuser.save
# 	if @newuser
# 			session[:user] = @newuser.username  
# 			erb :account
#     else
#       erb :error
#     end
# 		erb :signup
		redirect('/')
	end
	
	get '/account' do
		@newuser = User.new ({:username => params[:username], :gender => params[:gender], :password => params[:password]})
		@users = User.all
		@user = User.find_by_id session[:user_id]
		erb :account
	end
 
	get'/discover' do
		erb :discover
  end
end