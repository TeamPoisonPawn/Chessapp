class Bishop < Piece
  # The bishop may move as far as it wants, but only diagonally.
  # Each bishop starts on one color (light or dark) and must always stay on that color.
  # def initialize(args)
  #   super
  #   if args[:color] == 1
  #     write_attribute(:piece_type, "white-bishop.jpg")
  #   else
  #     write_attribute(:piece_type, "black-bishop.jpg")
  #   end
  # end

  def can_move?(x_destination, y_destination)
    if x_destination == x_pos || y_destination == y_pos
      return false
    end
    true
  end
end
