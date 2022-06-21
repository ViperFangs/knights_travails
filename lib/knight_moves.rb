# frozen_string_literal: true

require_relative 'knight'

def knight_moves(start_move_array, end_move_array)
  # knight_moves_helper will return the final move knight instance
  end_move_knight = knight_moves_helper(start_move_array, end_move_array)
  path_array = calculate_path(end_move_knight)
  display_path(path_array)
end

def knight_moves_helper(start_move_array, end_move_array)
  moves_queue = []
  moves_queue.push(Knight.new(start_move_array))
  moves_visited = Hash.new(false)
  moves_visited[start_move_array] = true

  until moves_queue.empty?
    current_knight = moves_queue.shift
    current_knight_moves = current_knight.next_moves

    return current_knight if current_knight.position == end_move_array

    current_knight_moves.each do |move|
      next if moves_visited[move]

      moves_visited[move] = true
      new_knight = Knight.new(move)
      new_knight.previous_move = current_knight
      moves_queue.push(new_knight)
    end
  end
end

def calculate_path(knight)
  return_array = [knight.position]

  until knight.previous_move.nil?
    return_array.push(knight.previous_move.position)
    knight = knight.previous_move
  end

  return_array.reverse
end

def display_path(path_array)
  puts "You made it in #{path_array.length - 1} moves! Here's your path: "

  path_array.each do |move|
    puts move.to_s
  end
end

knight_moves([6, 7], [0, 0])
