class Bishop < Piece
  # The bishop may move as far as it wants, but only diagonally.
  # Each bishop starts on one color (light or dark) and must always stay on that color.
  def initialize(args)
    super
    if args[:color] == 1
      write_attribute(:symbol, "white-bishop.jpg")
    else
      write_attribute(:symbol, "black-bishop.jpg")
    end
  end
end
