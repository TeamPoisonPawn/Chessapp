class Rook < Piece

  def valid_move?(x_destination, y_destination)
    super && legal_move?(x_destination, y_destination)
  end

  def legal_move?(x_destination, y_destination)
    if (x_pos - x_destination).abs == (y_pos - y_destination).abs
      return false
    end
    true
  end
  # The rook may move as far as it wants, but only forward, backward, and to the sides.

end
