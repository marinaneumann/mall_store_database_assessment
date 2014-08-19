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

main_menu