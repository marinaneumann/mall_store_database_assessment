require 'spec_helper'

describe Mall do 
	it 'initializes each new mall and returns the name' do
		test_mall = Mall.new({:name => 'Pioneer Square'})
		expect(test_mall).to be_an_instance_of Mall
		expect(test_mall.name).to eq 'Pioneer Square'
	end
end