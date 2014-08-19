class Mall 

attr_accessor :name

def initialize(attributes)
	@name = attributes[:name]
end

def self.all
	@malls = []
	results = DB.exec("SELECT * FROM malls;")
	results.each do |result|
		@malls << Mall.new({:name => result['name']})
	end
	@malls
end

def save
	results = DB.exec("INSERT INTO malls (name) VALUES ('#{@name}');")
end

def ==(another_mall)
	self.name == another_mall.name
end

end