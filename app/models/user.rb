require 'bcrypt'
class User < ActiveRecord::Base
  has_many :favorites
	
end