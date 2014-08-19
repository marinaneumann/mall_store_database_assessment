class Store 

attr_accessor :name 

def initialize(attributes)
	@name = attributes[:name]
end

def self.all
	@stores = []
end

end