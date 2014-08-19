require 'spec_helper'

describe Mall do 
	it 'initializes each new mall and returns the name' do
		test_mall = Mall.new({:name => 'Pioneer Square'})
		expect(test_mall).to be_an_instance_of Mall
		expect(test_mall.name).to eq 'Pioneer Square'
	end

	it 'starts with an empty array of malls' do 
		expect(Mall.all).to eq []
	end

	it 'adds a mall and saves it' do 
		test_mall = Mall.new({:name => 'Pioneer Square'})
		test_mall.save
		expect(Mall.all).to eq [test_mall]
	end

	it 'compares two malls with the same attributes' do 
		test_mall1 = Mall.new({:name => 'Pioneer Square'})
		test_mall2 = Mall.new({:name => 'Pioneer Square'})
		expect(test_mall1).to eq test_mall2
	end

	it 'sets an ID when you save it' do 
		test_mall = Mall.new({:name => 'Pioneer Square'})
		test_mall.save
		expect(test_mall.id).to be_an_instance_of Fixnum
	end

	it 'will delete an instance of the mall' do 
		test_mall = Mall.new({:name => 'Pionner Square'})
		test_mall.save
		test_mall1 = Mall.new({:name => 'Valley Fair'})
		test_mall1.save
		test_mall1.delete
		expect(Mall.all).to eq [test_mall]
	end

	it 'returns the mall from the database with the matching id' do 
		test_mall = Mall.new({:name => 'Pioneer Square', :id => 1})
		test_mall.save
		expect(Mall.find(test_mall.id)).to eq test_mall
	end

	it 'adds stores to a mall' do 
		test_mall = Mall.new({:name => 'Pioneer Square'})
		test_mall.save
		test_store = Store.new({:name => 'Nike'})
		test_store.save
		test_mall.add_store(test_store.id)
		expect(test_mall.get_stores).to eq [test_store]
	end



end