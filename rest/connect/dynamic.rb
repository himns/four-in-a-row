arg_list = [vertical, horizonal1, horizontal2]

define_method :vertical do |active_player, x+1, y|
  if ((x < 0 || x > 5) || (y < 0 || y > 6))
    return 0  
  end

  if @matrix[x][y] == active_player
    consec = 1
    puts "player:#{active_player} has #{consec} discs"
  else
    return 0 
  end

  consec = consec + consecutives(active_player, x+1, y)
  consec
end

# warning when outside the y axis, when choosing a column
# see why it waits for the second to put a disc in order to say the first won