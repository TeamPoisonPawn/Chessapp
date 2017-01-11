class King < Piece
  # The king is the most important piece, but is one of the weakest.
  # The king can only move one square in any direction - up, down, to the sides, and diagonally.
  # ** Special case **
  # The king may never move himself into check (where he could be captured).


  # def initialize(args)
  #   super
  #   if args[:color] == 1
  #     write_attribute(:piece_type, "white-king.jpg")
  #   else
  #     write_attribute(:piece_type, "black-king.jpg")
  #   end
  # end

  def can_move?(x_destination, y_destination)
    return false if move_too_far?(x_destination, y_destination)
    true
 end

 private

  def move_too_far?(x_destination, y_destination)
    return true if (x_pos - x_destination).abs > 1
    return true if (y_pos - y_destination).abs > 1
    false
  end
end
