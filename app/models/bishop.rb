class Bishop < Piece
  # The bishop may move as far as it wants, but only diagonally.
  # Each bishop starts on one color (light or dark) and must always stay on that color.
  def valid_move?(x_destination, y_destination)
    super && legal_move?(x_destination, y_destination)
  end

  def legal_move?(x_destination, y_destination)
    if (x_destination - x_pos).abs == (y_destination - y_pos).abs
      return true
    end
    false
  end
end
