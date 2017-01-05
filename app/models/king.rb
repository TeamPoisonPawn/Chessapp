class King < Piece
  # The king is the most important piece, but is one of the weakest.
  # The king can only move one square in any direction - up, down, to the sides, and diagonally.
  # ** Special case **
  # The king may never move himself into check (where he could be captured).
  def initialize(args)
    super
    if args[:color] == 1
      write_attribute(:symbol, "white-king.jpg")
    else
      write_attribute(:symbol, "black-king.jpg")
    end
  end
end
