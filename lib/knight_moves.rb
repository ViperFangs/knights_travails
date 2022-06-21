require_relative 'knight'
require 'set'

def knight_moves(start_move_array, end_move_array)
  moves_queue = [start_move_array]
  moves_visited = Hash.new(false)
  moves_visited[start_move_array] = true

  until moves_queue.empty?
    current_move = moves_queue.shift
    current_knight = Knight.new(current_move)
    current_knight_moves = current_knight.next_moves

    p "Current Knight Position: #{current_knight.position} Possible Moves: #{current_knight_moves}"

    if current_move == end_move_array
      p current_move.to_s
      return true
    end

    current_knight_moves.each do |move|
      next if moves_visited[move]

      moves_queue.push(move)
      moves_visited[move] = true
    end
  end
end

p knight_moves([3, 3], [4, 3])
