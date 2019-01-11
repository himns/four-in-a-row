require_relative 'hero'

class Princess 
    attr_accessor :name, :coordinates

    def initialize(name, coordinates)
        @name = name
        @coordinates = coordinates
    end

    def die(lost_life)
        #if hero lost life, put a message and exit game
    end

end