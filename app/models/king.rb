class King < Piece
  # The king is the most important piece, but is one of the weakest.
  # The king can only move one square in any direction - up, down, to the sides, and diagonally.
  # ** Special case **
  # The king may never move himself into check (where he could be captured).
  def valid_move?(x_destination, y_destination)
    super && legal_move?(x_destination, y_destination) && !will_move_into_check?(x_destination, y_destination)
  end

  #king movement is only at 1 so when x_destination must be -1 from the location of the king(params)
  def legal_move?(x_destination, y_destination)
    x_movement_difference = (x_destination - self.x_pos).abs
    y_movement_difference = (y_destination - self.y_pos).abs

    x_movement_difference.between?(0, 1) && y_movement_difference.between?(0, 1)
  end

  def will_move_into_check?(x_dest, y_dest)
    start_x = x_pos
    start_y = y_pos
    check = false

    self.update_attributes(x_pos: x_dest, y_pos: y_dest)
    check = game.check?(self.color)
    self.update_attributes(x_pos: start_x, y_pos: start_y)

    return check
  end

  def can_move_out_of_check?
    start_x = x_pos
    start_y = y_pos
    can_move = false

    ((x_pos - 1)..(x_pos + 1)).each do |x|
      ((y_pos - 1)..(y_pos + 1)).each do |y|
        if valid_move?(x, y)
          update_attributes(x_pos: x, y_pos: y)
          can_move = true unless game.check?(color)
          update_attributes(x_pos: start_x, y_pos: start_y)
        end
      end
    end
    return can_move
  end
end
