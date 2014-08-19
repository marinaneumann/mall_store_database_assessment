class Store 

attr_accessor :name, :id

def initialize(attributes)
	@name = attributes[:name]
	@id = attributes[:id]
end

def self.all
	@stores = []
	results = DB.exec("SELECT * FROM stores;")
	results.each do |result|
		@stores << Store.new({:name =>result['name']})
	end
	@stores
end

def save
	results = DB.exec("INSERT INTO stores (name) VALUES ('#{@name}') RETURNING id;")
	@id =results.first['id'].to_i
end

def ==(another_store)
	self.name == another_store.name
end

def self.find(store_id)
	results = DB.exec("SELECT * FROM stores WHERE id = #{store_id};")[0]
	Store.new({:name =>results['name'], :id =>results['id']})
end

def delete
	DB.exec("DELETE FROM stores WHERE id =#{@id};")
end

end