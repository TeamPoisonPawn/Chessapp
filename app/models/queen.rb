class Queen < Piece
  # She can move in any one straight direction - forward, backward, sideways,
  # or diagonally - as far as possible as long as she does not move through any of her own pieces.
  def initialize(args)
    super
    if args[:color] == 1
      write_attribute(:symbol, "white-queen.jpg")
    else
      write_attribute(:symbol, "black-queen.jpg")
    end
  end
end
end
