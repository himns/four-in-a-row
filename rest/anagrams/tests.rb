require 'byebug'
# wid = 60
# arr = [["Getting started", 1], ["Numbers", 9], ["Letters", 19]]
# title = "Table of contents"         
# puts title.center(50) 
# arr.each_with_index do |item, value|

#   value += 1
#   thing, nbr = item
#   beginning = "Chapter #{value} " + thing
#   ending = "page + #{nbr}"

#   puts beginning.ljust(50/2) + ending.rjust(50/2)
# end

# a = [["Do you have a name?"],
#       ["Do you like bikes?"],
#       ["Do you have a favorite color?"]
# ]

# def ask_question question
#   while true
#     puts question
#     reply = gets.chomp.downcase

#     return true if reply == "yes"
#     return false if reply == "no"

#     puts "Please reply with yes/no"
#   end

#   answer    #this is what we return
# end

# a.each do |question|

#   puts ask_question(question)

# end
# while true
#   puts "say a number"
#   x = gets.chomp.to_i

#   if x / 1000 == 1
#     puts "M"
#     break
#   end

#   if x % 500 == 0
#     puts "D"
#     break
#   end
  # x = 5
  # def hundred x
  #   res = 0
  #   if x % 500 >= 400
  #       res = "CCCC"
  #     elsif
  #       x % 500 >= 300
  #       res = "CCC"
  #     elsif 
  #       x % 500 >= 200
  #       res = "CC"
  #     elsif
  #       x % 500 >=100
  #       res = "C"
  #   end
  #   res
  # end

  # puts hundred(900)

#   if x / 500 == 1
#     puts hundred(x)
#     bigger_than_five_hundred = "D"
#     bigger_than_five_hundred += hundred
#     puts bigger_than_five_hundred
#     puts hundred
#     break
#   end

  

#   if x / 500 < 1
#     h = hundred
#     puts h
#     break
#   end

# end

## define region size

M = 'land'
o = 'water'
map =    [[o,o,o,o,o,o,o,o,o,o,o],
          [o,o,o,o,M,M,o,o,o,o,o],
          [o,o,o,o,o,o,o,o,M,M,o],
          [o,o,o,M,o,o,o,o,o,M,o],
          [o,o,o,M,o,M,M,o,o,o,o],
          [M,M,M,o,M,M,M,M,o,o,o],
          [o,o,o,M,M,M,M,M,M,M,o],
          [o,o,o,M,M,o,M,M,M,o,o],
          [o,o,o,o,o,o,M,M,o,o,o],
          [o,M,o,o,o,M,o,o,o,o,o],
          [o,o,o,o,o,o,o,o,o,o,o]]


def continent_size(map, x, y)
  if map[y][x] != "land"
    puts map[y][x] != "land"
    #  Either it's water or we already
    #  counted it, but either way, we don't
    #  want to count it now.
    return 0
  end

  
  size = 1
  map[y][x] = "flag"
  print x 
  print y

size = size + continent_size(map, x-1, y-1)
size = size + continent_size(map, x  , y-1)
size = size + continent_size(map, x+1, y-1)
size = size + continent_size(map, x-1, y  )
size = size + continent_size(map, x+1, y  )
size = size + continent_size(map, x-1, y+1)
size = size + continent_size(map, x  , y+1)
size = size + continent_size(map, x+1, y+1)

size 

end

puts continent_size(map, 5, 9)
#puts map[3][0] != "land"



  
