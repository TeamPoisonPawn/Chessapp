class Knight < Piece

  # Knights move in a very different way from the other pieces – going two squares in one
  # direction, and then one more move at a 90 degree angle, just like the shape of an “L”.
  # Knights are also the only pieces that can move over other pieces.


  def valid_move?(x_destination, y_destination)
    super
    if x_pos == x_destination || y_pos == y_destination
      return false
    end
    (x_pos - x_destination).abs + (y_pos - y_destination).abs == 3
  end

  def is_obstructed?(x_destination, y_destination)
    return false
  end

end
