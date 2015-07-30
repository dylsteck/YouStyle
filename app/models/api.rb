require "open-uri"
class API
	#this uses the ShopStyle API
	def getbrands 
		data = open("http://api.shopstyle.com/api/v2/retailers?pid=uid6609-30888897-90").read
		JSON.parse(data)
	end
	def getcategories
		data = open("http://api.shopstyle.com/api/v2/categories?pid=uid6609-30888897-90").read
		JSON.parse(data)
	end
	def getcolors
		data = open("http://api.shopstyle.com/api/v2/colors?pid=uid6609-30888897-90").read
		JSON.parse(data)
	end
end