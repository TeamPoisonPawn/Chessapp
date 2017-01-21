class Rook < Piece
  
  def can_move?(x_destination, y_destination)
    return false if (x_pos - x_destination).abs == (y_pos - y_destination).abs
    true
  end


  # The rook may move as far as it wants, but only forward, backward, and to the sides.

end
