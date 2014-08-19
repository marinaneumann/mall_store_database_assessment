require 'spec_helper'

describe Store do 
	it 'initializes a new store and returns the characteristics' do 
		test_store = Store.new({:name => 'Nike'})
		expect(test_store).to be_an_instance_of Store
		expect(test_store.name).to eq 'Nike'
	end

	it 'starts with an empty array of stores' do
		expect(Store.all).to eq []
	end

	it 'adds a store and saves it' do 
		test_store = Store.new({:name => 'Nike'})
		test_store.save
		expect(Store.all).to eq [test_store]
	end

	it 'compares two stores with same attributes' do 
		test_store = Store.new({:name => 'Nike'})
		test_store1 = Store.new({:name => 'Nike'})
		expect(test_store).to eq test_store1
	end

	it 'sets an ID when you save it' do 
		test_store = Store.new({:name => 'Nike'})
		test_store.save
		expect(test_store.id).to be_an_instance_of Fixnum
	end

	it 'returns the store from the database with the matching id' do 
		test_store = Store.new({:name => 'Nike', :id => 1})
		test_store.save
		expect(Store.find(test_store.id)).to eq test_store
	end

	it 'deletes an instance of that store' do 
		test_store = Store.new({:name => 'Nike'})
		test_store.save
		test_store1 = Store.new({:name => 'Nordstroms'})
		test_store1.save
		test_store1.delete
		expect(Store.all).to eq [test_store]
	end



end