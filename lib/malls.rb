class Mall 

attr_accessor :name, :id

def initialize(attributes)
	@name = attributes[:name]
	@id = attributes[:id]
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


end