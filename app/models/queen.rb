class Queen < Piece
  # She can move in any one straight direction - forward, backward, sideways,
  # or diagonally - as far as possible as long as she does not move through any of her own pieces.
 

  def can_move?(x, y)
    x_pos == x || y_pos == y ||
    (x_pos - x).abs == (y_pos - y).abs
  end
end
