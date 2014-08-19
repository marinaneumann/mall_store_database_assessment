require 'spec_helper'

describe Store do 
	it 'initializes a new store and returns the characteristics' do 
		test_store = Store.new({:name => 'Nike'})
		expect(test_store).to be_an_instance_of Store
		expect(test_store.name).to eq 'Nike'
	end
end