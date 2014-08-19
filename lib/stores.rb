class Store 

attr_accessor :name 

def initialize(attributes)
	@name = attributes[:name]
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
	results = DB.exec("INSERT INTO stores (name) VALUES ('#{@name}');")
end

def ==(another_store)
	self.name == another_store.name
end




end