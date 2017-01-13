class Knight < Piece

  # Knights move in a very different way from the other pieces – going two squares in one
  # direction, and then one more move at a 90 degree angle, just like the shape of an “L”.
  # Knights are also the only pieces that can move over other pieces.

  def initialize(args)
    super
    if args[:color] == 1
      write_attribute(:piece_type, "white-knight.jpg")
    else
      write_attribute(:piece_type, "black-knight.jpg")
    end
  end

  def legal_move?(x, y)
    if x_pos == x || y_pos == y
      return false
    end
    (x_pos - x).abs + (y_pos - y).abs == 3
  end

  def is_obstructed?(x_destination, y_destination)
    return false
  end

end
