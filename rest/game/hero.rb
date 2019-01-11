#require_relative 'characters'

class Hero   
	attr_accessor :lives, :coordinates

	def initialize (coordinates)
		@lives = rand(1..4)
		@coordinates = coordinates
	end

	def get_direction
		
		while true
			puts "Press up/down and left/right keys to start moving your hero"
			next_move = gets.chomp.downcase
			move = ''
			if next_move == 'left'
				move = [0, -1]
			elsif next_move == 'right'
				move = [0, 1]
			elsif next_move == 'up'
				move = [-1, 0]
			elsif next_move == 'down'
				move = [1, 0]
			else 
				puts "retry"
			end
			break if ! move.empty?
		end
		return move
	end

	

end
 

 