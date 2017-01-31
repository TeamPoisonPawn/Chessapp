class Queen < Piece
  # She can move in any one straight direction - forward, backward, sideways,
  # or diagonally - as far as possible as long as she does not move through any of her own pieces.
  def initialize(args)
    super
    if args[:color] == "white"
      write_attribute(:piece_type, "white-queen.jpg")
    else
      write_attribute(:piece_type, "black-queen.jpg")
    end
  end
end
