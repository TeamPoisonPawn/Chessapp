class Queen < Piece
  # She can move in any one straight direction - forward, backward, sideways,
  # or diagonally - as far as possible as long as she does not move through any of her own pieces.
  # def initialize(args)
  #   super
  #   if args[:color] == 1
  #     write_attribute(:piece_type, "white-queen.jpg")
  #   else
  #     write_attribute(:piece_type, "black-queen.jpg")
  #   end
  # end

  def can_move?(x_destionation, y_destination)
    return false unless valid_move?(x_destionation, y_destination)
    #Queen can move horizontal, vertical, and diagnol
    return false unless (horizontal?(y_destination) || vertical?(x_destionation)|| diagonal?(x_destionation, y_destination))
    true  
  end
#   def can_move?(x_destionation, y_destination)
#   (valid_move?(x_destionation, y_destination) &&
#      (horizontal?(y_destination) || vertical?(x_destionation)|| diagonal?(x_destionation, y_destination)))
#   #Queen can move horizontal, vertical, and diagnol
# end
end
