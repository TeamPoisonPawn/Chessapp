class Queen < Piece
  # She can move in any one straight direction - forward, backward, sideways,
  # or diagonally - as far as possible as long as she does not move through any of her own pieces.

  def valid_move? (x_destination, y_destination)
    super && legal_move?(x_destination, y_destination)
  end

  def legal_move?(x_destination, y_destination)
    #can move horizontal, vertical, and diagnol the length of the board, unless obstructed.
    x_pos == x_destination || y_pos == y_destination || 
      (x_pos - x_destination).abs == (y_pos - y_destination).abs
  end
end

# return false if x_destination == x_pos || y_destination == y_pos
# return false if (x_pos - x_destination).abs == (y_pos - y_destination).abs
#     true