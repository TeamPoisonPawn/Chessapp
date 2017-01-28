class Rook < Piece
  # The rook may move as far as it wants, but only forward, backward, and to the sides.

  def initialize(args) #change initialize to: after_initialize do
    super
    if args[:color] == 1
      write_attribute(:piece_type, "white-rook.png")
    else
      write_attribute(:piece_type, "black-rook.png")
    end
  end
end
