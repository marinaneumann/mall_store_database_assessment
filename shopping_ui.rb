require 'pg'
require './lib/malls'
require './lib/stores'

DB = PG.connect(:dbname => 'mall_store')

def main_menu
	system 'clear'
	loop do 
		puts "***Shopping Directory***\n\n"
		puts "[1] to add a mall"
		puts "[2] to add a store"
		puts "[x] to exit"

		main_choice = gets.chomp

		if main_choice == '1'
			add_mall
		elsif main_choice == '2'
			add_store
		elsif main_choice == 'x'
			exit 
		else 
			puts "Please put a valid option"
		end
	end
end

def add_mall 
	puts "What mall would you like to add?"
	mall_input = gets.chomp
	new_mall = Mall.new({:name => mall_input})
	new_mall.save
	puts "#{Mall.all.last.name} added to the directory"
	mall_menu(new_mall)
end

def mall_menu
	puts "**Exploring Malls**"
	puts "[1] to add stores to a mall"
	puts "[2] to go back to main_menu"

	choice = gets.chomp

	if choice == '1'
		add_store_mall
	elsif choice == '2'
		main_menu
	else
		puts "Please put a valid option"
	end
end

def add_store_mall
	@stores = Store.all
	@stores.each do |store|
		@store_number = Store.all.index(store).to_s
		puts @store_number + " " + store.name
	end
	puts "What store would you like to add to this mall?"
	store_choice = gets.chomp.to_i
	mall.add_store(@stores[store_choice].id)
end

def add_store
	puts "What store would you like to add?"
	store_input = gets.chomp
	new_store = Store.new({:name => store_input})
	new_store.save
	puts "#{Store.all.last.name} added to the directory"
	store_menu(new_store)
end

def store_menu
	puts "**Exploring Stores**"
	puts "[1] to update store registry"
	puts "[2] to search for a store"
	puts "[3] to go back to main_menu"

	choice = gets.chomp

	if choice == '1'
		update_store
	elsif choice == '2'
		search_store
	elsif choice == '3'
		main_menu
	else
		puts "Please put a valid option"
	end
end

end
main_menu