require "open-uri"
class Brands
	def getbrands 
		data = open("http://api.shopstyle.com/api/v2/retailers?pid=uid6609-30888897-90").read
		JSON.parse(data)
	end
end