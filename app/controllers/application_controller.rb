require_relative "../../config/environment"
require_relative "../models/api.rb"
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
			@brands = Brands.new.getbrands["retailers"]
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
		@brands = Brands.new.getbrands["retailers"]
		erb :account
	end
 
  get'/discover' do
    @brands = Brands.new.getbrands["retailers"]
		erb :discover
  end
  
  post '/discover' do
    erb :discover
  end
  
  post '/search' do
    erb :search
  end
  
	get '/signout' do 
		session[:user_id] = nil
		redirect('/')
	end

end