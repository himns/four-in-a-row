class Character

	attr_accessor :coordinates
	
	def initialize (coordinates)
		@coordinates = []
	end

	def fight
		@coordinates += [1, 2]
		puts @coordinates.class
	end

	def die
	end

end
