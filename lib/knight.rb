# frozen_string_literal: true

# class Knight stores its current_position, the next possible moves and the previous_move that it came from
class Knight
  attr_accessor :position, :next_moves, :previous_move

  def initialize(position_array)
    self.position = position_array
    self.next_moves = possible_moves(position_array)
    self.previous_move = nil
  end

  private

  def possible_moves(position_array)
    board_end_point = 8
    board_start_point = 0
    return_moves = []
    current_row = position_array[0]
    current_column = position_array[1]

    if current_row + 2 < board_end_point && current_column + 1 < board_end_point
      return_moves.push([current_row + 2, current_column + 1])
    end

    if current_row + 2 < board_end_point && current_column - 1 >= board_start_point
      return_moves.push([current_row + 2, current_column - 1])
    end

    if current_row - 2 >= board_start_point && current_column + 1 < board_end_point
      return_moves.push([current_row - 2, current_column + 1])
    end

    if current_row - 2 >= board_start_point && current_column - 1 >= board_start_point
      return_moves.push([current_row - 2, current_column - 1])
    end

    if current_row + 1 < board_end_point && current_column + 2 < board_end_point
      return_moves.push([current_row + 1, current_column + 2])
    end

    if current_row - 1 >= board_start_point && current_column + 2 < board_end_point
      return_moves.push([current_row - 1, current_column + 2])
    end

    if current_row + 1 < board_end_point && current_column - 2 >= board_start_point
      return_moves.push([current_row + 1, current_column - 2])
    end

    if current_row - 1 >= board_start_point && current_column - 2 >= board_start_point
      return_moves.push([current_row - 1, current_column - 2])
    end

    return_moves
  end
end
