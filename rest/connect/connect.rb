require_relative 'grid'
require 'byebug'

class Connect

  attr_reader :players, :active_player

  def initialize 
    @players = [Player.new(1), Player.new(2)]
    @active_player = @players[0]
  end

  def play_in_turn 
    user_input
  end

    def user_input 
    print "#{active_player.name}, what column do you want to place your disc on?"
    gets.chomp.to_i
  end

  def current_player
    @active_player == @players[1] ? @active_player = @players[0] : @active_player = @players[1]
  end
  
end

connect = Connect.new
matrix = Grid.new
loop do
  matrix.print_matrix
  chosen_column = connect.play_in_turn
  available = matrix.available_row(connect.active_player.name, 5, chosen_column)
  if !available 
    puts "\n There is no more space in this column, or you went out the playground area \n "
    next
  else
    connect.active_player.store_disc_position(available, chosen_column)
    
    vertical = matrix.consecutives(connect.active_player.name, available, chosen_column, 'vertical')
    if vertical == 3
      puts "Player #{connect.active_player.name} won!"
      matrix.print_matrix
      break
    end

    horizontal_right = matrix.consecutives(connect.active_player.name, available, chosen_column, 'horizontal_right')
    if horizontal_right == 3
      puts "Player #{connect.active_player.name} won!"
      matrix.print_matrix
      break
    end
    
    horizontal_left = matrix.consecutives(connect.active_player.name, available, chosen_column, 'horizontal_left')
    if (horizontal_left + horizontal_right == 3)
      puts "Player #{connect.active_player.name} won!"
      matrix.print_matrix
      break
    end

    diagonal_left_down = matrix.consecutives(connect.active_player.name, available, chosen_column, 'diagonal_left_down')
    if diagonal_left_down == 3
      puts "Player #{connect.active_player.name} won!"
      matrix.print_matrix
      break
    end
    
    diagonal_right_up = matrix.consecutives(connect.active_player.name, available, chosen_column, 'diagonal_right_up')
    if (diagonal_right_up + diagonal_left_down == 3)
      puts "Player #{connect.active_player.name} won!"
      matrix.print_matrix
      break
    end

    diagonal_left_up = matrix.consecutives(connect.active_player.name, available, chosen_column, 'diagonal_left_up')
    if diagonal_left_up == 3
      puts "Player #{connect.active_player.name} won!"
      matrix.print_matrix
      break
    end
    
    diagonal_right_down = matrix.consecutives(connect.active_player.name, available, chosen_column, 'diagonal_right_down')
    if (diagonal_right_down + diagonal_left_up == 3)
      puts "Player #{connect.active_player.name} won!"
      matrix.print_matrix
      break
    end

  end

  connect.current_player
end
 
 