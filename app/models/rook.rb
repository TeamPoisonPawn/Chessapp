class Rook < Piece
  after_initialize do
    if color == 1
      write_attribute(:piece_type, "white-#{type.downcase}.jpg")
    else
      write_attribute(:piece_type, "black-#{type.downcase}.jpg")
    end
  end
  # The rook may move as far as it wants, but only forward, backward, and to the sides.

  # def initialize(args) #change initialize to: after_initialize do
  #   super
  #   if args[:color] == 1
  #     write_attribute(:piece_type, "white-rook.jpg")
  #   else
  #     write_attribute(:piece_type, "black-rook.jpg")
  #   end
  # end
end
