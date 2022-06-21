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
    return_moves = []
    possible_moves = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]

    possible_moves.each do |move|
      row = position_array[0] + move[0]
      column = position_array[1] + move[1]

      return_moves << [row, column] if row.between?(0, 7) && column.between?(0, 7)
    end

    return_moves
  end
end
