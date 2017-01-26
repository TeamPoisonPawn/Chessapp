class King < Piece
  # The king is the most important piece, but is one of the weakest.
  # The king can only move one square in any direction - up, down, to the sides, and diagonally.
  # ** Special case **
  # The king may never move himself into check (where he could be captured).

  def valid_move?(x_destination, y_destination)
    super
    return false if move_too_far?(x_destination, y_destination)
    true
  end


  private
  #king movement is only at 1 so when x_destination must be -1 from the location of the king(params)
  def move_too_far?(x_destination, y_destination)
    return true if (x_pos - x_destination).abs > 1
    return true if (y_pos - y_destination).abs > 1
    false
  end

  #This is where logic to check if the King has moved or not
  #Must also check if Rook has moved as well.
  #This accounts for Whiteside-Rook (0,0) & (0,7)
  #Also accounts for Blackside-Rook (7,0) & (7,7)
  def valid_castling?(x_destination, y_destination)
    return false if x_pos == 4
    #white_king, kingside castling

    #white_king, queenside castling

    #black_king, kingside castling

    #black_king, queenside castling
  end

end
