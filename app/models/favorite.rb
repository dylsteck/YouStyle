require "open-uri"
class Favorite < ActiveRecord::Base
  belongs_to :user
	
	def convert
		data = open("http://api.shopstyle.com/api/v2/products/#{read_attribute(:itemid).to_s}?pid=uid6609-30888897-90").read
		JSON.parse(data)
		end
end