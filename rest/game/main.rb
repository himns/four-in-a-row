require_relative 'princess'
require_relative 'monster'
require_relative 'hero'
require 'byebug'

class Game

	# attr_accessor :map_size, :monsters

  def initialize  
		@map_size = []
		@monsters = []
		@princess  
		@hero  

	end
	
	def ask_for_coord(sometext)
		puts sometext
		coord =  gets.chomp.split.map(& :to_i)
		coord
	end

	def set_map
		question = "Set the coordinates of your map, space separated"
		@map_size = ask_for_coord(question)
		@map_size
	end

	def create_monsters 
		counter = 0
		while counter < 5 do
			counter += 1
			x = rand(@map_size[0])
			y = rand(@map_size[1])
			#m1 = Monster.new([x, y])
			#@monsters << m1
			@monsters << ([x, y])
		end
	end

	def compare (x, y)
		if (x > @map_size[0] || y > @map_size[1]) || (x < 0 || y < 0)
			puts val = "Cannot set position outside the map" 
			return val
		end
	end

	def set_hero_location
		while true
			question = "Now set the coordinates of your hero"
			hero_location = ask_for_coord(question)

			if compare(hero_location[0], hero_location[1]) == nil
				@hero = Hero.new(hero_location)
				break
			end

		end
	end

	def set_princess_location
		
			puts "Give your princess a name also"
			name_princess = gets.chomp

			loop do
			question = "Now set the coordinates of your princess"
			princess_location = ask_for_coord(question)

			if compare(princess_location[0], princess_location[1]) == nil
				@princess = Princess.new(name_princess, princess_location)
				break
			end

		end
	end


	def check_hero_position(coordinates)
		
		coordinates = [@hero.coordinates, coordinates].transpose.map {|x| x.reduce(:+)}
		@hero.coordinates = coordinates
		# check whether position inside the map
		if compare(coordinates[0], coordinates[1]) != nil
			return
		end

		# in princess position???
		
		if (@princess.coordinates[0] == coordinates[0]) && (@princess.coordinates[1] == coordinates[1])
			puts "You have just rescued princess #{@princess.name}!!"
			exit!
		end

		# met monster?
		puts coordinates
		# @monsters.each {|x, y| puts "#{x} + #{y} + ----------"}
		@monsters.each do |x, y|
			if (x ==  coordinates[0] && y == coordinates[1])
				meet_monster = "You bumped into a monster"
				puts meet_monster + "!!!!!!!!!!!!!!"
				return meet_monster
			end
		end

	end

	
	def fight
		puts @hero.lives -= 1
		if @hero.lives <= 0
			puts "Your hero is dead" 
			exit!
		end
	end

	def run 
		set_map
		set_hero_location
		set_princess_location
		create_monsters

		loop do
			puts @hero.coordinates
			meet_monster = check_hero_position(@hero.get_direction)
			# if we met a monster, monster asks the question, hero answers randomly
			if meet_monster == "You bumped into a monster"
			# if no monster in that position, ask hero for direction
		
				monster = Monster.new
				monster.ask_if_fight
				hero_decision = gets.chomp.downcase 
				if hero_decision == "yes"
					fight
				else 
					"Your hero lost all his #{@hero.lives}"
					exit!
				end
			end
		end
	end

end

g = Game.new
g.run
 




  



