# in recursion the function has to return the same type of value (integer, string, etc)
require_relative 'player'
require 'byebug'

class Grid

  attr_reader :matrix

  def initialize
    @matrix = set_matrix
  end

  def set_matrix
    # matrix = Array.new(6, Array.new(7))     does weird stuff
    matrix = Array.new(6){Array.new(7)}
    matrix.each_with_index do |subarray, index|
      subarray.map! { |val, index| val = 0}
    end
  end

  def print_matrix
    puts "\n ------------ Playground ----------'\n'"
    pp @matrix
    puts "\n ---------------- End ------------- "
  end

  # ["vertical", "horizontal_right", "horizontal_left", "diagonal_left_down", "diagonal_left_up", "diagonal_right_down", "diagonal_right_up"].each do |action|
  #   define_method("#{action}") do |active_player, x, y, direction|

  #     x, y = direction == 'vertical' ? [x+1, y] : [x, y]
  #     x, y = direction == 'horizontal_right' ? [x, y+1] : [x, y]
  #     x, y = direction == 'horizontal_left' ? [x, y-1] : [x, y]
  #     x, y = direction == 'diagonal_left_down' ? [x+1, y-1] : [x, y]
  #     x, y = direction == 'diagonal_left_up' ? [x-1, y-1] : [x, y]
  #     x, y = direction == 'diagonal_right_down' ? [x+1, y+1] : [x, y]
  #     x, y = direction == 'diagonal_right_up' ? [x-1, y+1] : [x, y]

  #     if ((x < 0 || x > 5) || (y < 0 || y > 6))
  #       return 0  
  #     end
    
  #     if @matrix[x][y] == active_player
  #       consec = 1
  #     else
  #       return 0 
  #     end
    
  #     consec = consec + send(action, active_player, x, y, direction)
  #     consec
  # 	end
  # end


  def consecutives(active_player, x, y, direction)

    x, y = direction == 'vertical' ? [x+1, y] : [x, y]
    x, y = direction == 'horizontal_right' ? [x, y+1] : [x, y]
    x, y = direction == 'horizontal_left' ? [x, y-1] : [x, y]
    x, y = direction == 'diagonal_left_down' ? [x+1, y-1] : [x, y]
    x, y = direction == 'diagonal_left_up' ? [x-1, y-1] : [x, y]
    x, y = direction == 'diagonal_right_down' ? [x+1, y+1] : [x, y]
    x, y = direction == 'diagonal_right_up' ? [x-1, y+1] : [x, y]

    if ((x < 0 || x > 5) || (y < 0 || y > 6))
      return 0  
    end

    if @matrix[x][y] == active_player
      consec = 1
    else
      return 0 
    end

    consec = consec + consecutives(active_player, x, y, direction)
    consec
  end

  def available_row(active_player, x, y)
    if (x < 0) || (y > 6)
      return false
    elsif @matrix[x][y] == 0
      @matrix[x][y] = active_player
      return x
    else
      available_row(active_player, x-1, y)
    end
  end

end

