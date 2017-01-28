class Rook < Piece

  def valid_move?(x_destination, y_destination)
    super && legal_move?(x_destination, y_destination)
  end

  def legal_move?(x_destination, y_destination)
    if (x_pos == x_destination && y_pos != y_destination) || (y_pos == y_destination && x_pos != x_destination)
      return true
    end
    return false
  end
  # The rook may move as far as it wants, but only forward, backward, and to the sides.

end
