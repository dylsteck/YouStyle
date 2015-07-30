require_relative "../../config/environment"
require_relative "../models/api.rb"
 require_relative "../models/user.rb"
require_relative "../models/discoverend.rb"
require_relative "../models/favorite.rb"
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
			@brands = API.new.getbrands["retailers"]
# 		puts @brands
		@user = User.find_by_id session[:user_id]
		if session[:user_id] == nil
			erb :index
		 else
			 erb :account
    end
		
  end
	post '/' do
		@user = User.find_by username: params[:username], password: params[:password]
		if @user
			session[:user_id] = @user.id 
			redirect('/account')
     else
       erb :error
     end
end

	get'/signup' do
		erb :signup
  end

	post '/signup' do
		@newuser = User.new ({:username => params[:username], :gender => params[:gender], :password => params[:password]})
		@users = User.all
	@newuser.save
		redirect('/')
	end
	
	get '/account' do
		@newuser = User.new ({:username => params[:username], :gender => params[:gender], :password => params[:password]})
		@users = User.all
		@user = User.find_by_id session[:user_id]
		@brands = API.new.getbrands["retailers"]
		erb :account
	end
  
  post '/account' do
    @user = User.find_by_id session[:user_id]
    erb :account
  end
 
  get'/discover' do
		@user = User.find_by_id session[:user_id]
    @brands = API.new.getbrands["retailers"]
		@categories = API.new.getcategories["categories"]
		@colors = API.new.getcolors["colors"]
		erb :discover
  end
  
  post '/discover' do
    erb :discover
  end
  
	get '/search' do
		redirect ('/discover')
	@user = User.find_by_id session[:user_id]	
    erb :search
	end
  post '/search' do
		@discoverend = UserChoice.new.clothing(params[:type])["products"]
		@user = User.find_by_id session[:user_id]	
    erb :search
  end
  
	get '/signout' do 
		session[:user_id] = nil
		redirect('/')
	end

end