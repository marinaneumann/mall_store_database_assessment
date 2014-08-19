class Mall 

attr_accessor :name, :id

def initialize(attributes)
	@name = attributes[:name]
	@id = attributes[:id].to_i
end

def self.all
	@malls = []
	results = DB.exec("SELECT * FROM malls;")
	results.each do |result|
		@malls << Mall.new({:name => result['name'], :id => result['id']})
	end
	@malls
end

def save
	results = DB.exec("INSERT INTO malls (name) VALUES ('#{@name}') RETURNING id;")
	@id =results.first['id'].to_i
end	

def ==(another_mall)
	self.name == another_mall.name
end

def delete
	DB.exec("DELETE FROM malls WHERE id =#{@id};")
end

def self.find(mall_id)
	results = DB.exec("SELECT * FROM malls WHERE id = #{mall_id};")[0]
	Mall.new({:name => results['name'], :id => results['id']})
end

def add_store(store_id)
	DB.exec("INSERT INTO directory (stores_id, malls_id) VALUES (#{store_id}, #{@id});")
end

def get_stores
	@stores = []
	results = DB.exec("SELECT stores.* FROM malls JOIN directory ON (directory.malls_id = malls.id) 
					  JOIN stores ON (directory.stores_id = stores.id) WHERE  malls_id = #{@id};")
	results.each do |result|
		@stores << Store.new({:id => result['id'], :name => result['name']})
	end
	@stores
end


end