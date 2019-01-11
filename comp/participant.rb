# class Participant
#   CHICKENWINGS_SCORE = 5

#   attr_reader :name, :chickenwings, :hamburgers, :hotdogs

#   def initialize(args = {})
#     @name = args[:name]
#     @chickenwings = args.fetch(:chickenwings, 0) * CHICKENWINGS_SCORE
#     @hamburgers = args.fetch(:hamburgers, 0) * 3
#     @hotdogs = args.fetch(:hotdogs, 0) * 2
#   end

#   def score
#     @score = chickenwings + hamburgers + hotdogs
#   end
# end
x = "Goodbye" 
def my_method
  
  yield("cruel")
end
  x = "Hello"
  my_method {|y| "#{x = 1}, #{y} world" } # => "Hello, cruel world"
  puts x
 