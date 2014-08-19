require 'pg'
require './lib/malls'
require './lib/stores'

DB = PG.connect(:dbname => 'mall_store')

def main_menu
	system 'clear'
	loop do 
		puts "***Shopping Directory***\n\n"
		puts "[1] for malls"
		puts "[2] for stores"
		puts "[x] to exit"

		main_choice = gets.chomp

		if main_choice == '1'
			mall_menu
		elsif main_choice == '2'
			store_menu
		elsif main_choice == 'x'
			exit 
		else 
			puts "Please put a valid option"
		end
	end
end

def mall_menu
	puts "**Exploring Malls**"
	puts "[1] to add a mall"
	puts "[2] to update mall registry"
	puts "[3] to add stores to a mall"
	puts "[4] to search for a mall"
	puts "[5] to go back to main_menu"

	choice = gets.chomp

	if choice == '1'
		add_mall
	elsif choice == '2'
		update_mall
	elsif choice == '3'
		add_store_mall
	elsif choice == '4'
		search_mall
	elsif choice == '5'
		main_menu
	else
		puts "Please put a valid option"
	end
end

def add_mall 
	puts "What mall would you like to add?"
	mall_input = gets.chomp
	new_mall = Mall.new({:name => mall_input})
	new_mall.save
	puts "#{Mall.all.last.name} added to the directory"
end


end
main_menu