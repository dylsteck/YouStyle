class UserChoice
	def clothing(search)
		data = open("http://api.shopstyle.com/api/v2/products?pid=uid6609-30888897-90&fts="+ search.gsub(" ", "+") +"&offset=10&limit=99").read
		JSON.parse(data)
	end
end