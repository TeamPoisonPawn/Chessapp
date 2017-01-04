class Piece < ActiveRecord::Base
  belongs_to :game
  belongs_to :user

  def self.pieces
    %w(Pawn Rook Bishop Knight Queen King)
  end

  #If it passes all steps, move is valid
  def valid_move?(x_destination, y_destination)
    if move_is_nil?(x_destination, y_destination)
      return false
    elsif move_is_on_board?(x_destination, y_destination)
      return false
    elsif legal_move?(x_destination, y_destination)
      return false
    else is_obstructed?(x_destination, y_destination)
      return false
    end
  end

  #The board size at maximum (x-axis, y-axis)
  min_size = 0
  max_size = 7

  #is the piece moving?
  def move_is_nil?(x_destination, y_destination)
    x_location == x && y_location == y
  end

  #Check to see if the move exceeds the board size.
  #This is set by min_size & max_size
  def move_is_on_board?(x_destination, y_destination)
    (x <= max_size && x >= min_size) && (y <= max_size && y >= min_size)
  end

  #Can this piece move legally?
  def legal_move?(_x, _y)
    raise NotImplementError 'have #legal_move?'
  end


end
