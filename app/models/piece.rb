class Piece < ActiveRecord::Base
  belongs_to :game
  belongs_to :user

  def self.pieces
    %w(Pawn Rook Bishop Knight Queen King)
  end

  #The board size at maximum (x-axis, y-axis)
  $min_size = 0
  $max_size = 7

  def piece_type
    "#{self.color}-#{self.type.downcase}"
  end

  #is the piece moving?
  def move_is_nil?(x_destination, y_destination)
    x_destination == x_pos && y_destination == y_pos
  end

  #Check to see if the move exceeds the board size.
  #This is set by min_size & max_size
  def move_is_on_board?(x_destination, y_destination)
    (x_destination <= $max_size && x_destination >= $min_size) && (y_destination <= $max_size && y_destination >= $min_size)
  end

  #If it passes all steps, move is valid
  def valid_move?(x_destination, y_destination)
    !move_is_nil?(x_destination, y_destination) &&
    move_is_on_board?(x_destination, y_destination) &&
    !is_obstructed?(x_destination, y_destination)
  end

  #should have a side eg. white or black
  #functionality of all the unique pieces
  #how far pieces can move. special cases for all.
  #determine if piece is obstructed to move
  def is_obstructed?(x_destination, y_destination)
    game = Game.find(self.game_id)
    x_location = self.x_pos
    y_location = self.y_pos
    #check for vertical obstructions
    if x_location == x_destination
      y_location > y_destination ? incrementer = -1 : incrementer = 1
      y_position = y_location + incrementer
      while y_position != y_destination
        if game.pieces.where(x_pos: x_location, y_pos: y_position).any?
          return true
        end
        y_position += incrementer
      end
      return false
    #check for horizontal obstructions
    elsif y_location == y_destination
      x_location > x_destination ? incrementer = -1 : incrementer = 1
      x_position = x_location + incrementer
      while x_position != x_destination
        if game.pieces.where(x_pos: x_position, y_pos: y_location).any?
          return true
        end
        x_position += incrementer
      end
      return false
    #check for diagnol obstructions
    else
      (x_location - x_destination).abs != (y_location - y_destination).abs
      x_location > x_destination ? x_incrementer = -1 : x_incrementer = 1
      y_location > y_destination ? y_incrementer = -1 : y_incrementer = 1
      x_position = x_location + x_incrementer
      y_position = y_location + y_incrementer
      while x_position != x_destination && y_position != y_destination
        if game.pieces.where(x_pos: x_position, y_pos: y_position).any?
          return true
        end
        x_position += x_incrementer
        y_position += y_incrementer
      end
      return false
    end
  end

  def move_to!(x_dest, y_dest)
    if capture_or_clear?(x_dest, y_dest)
      self.update_attributes(x_pos: x_dest, y_pos: y_dest)
      return true
    end
    return false
  end

  def capture_or_clear?(x_dest, y_dest)
    dest_piece = piece_at_location(x_dest, y_dest)

    if dest_piece
      if dest_piece.color == self.color
        return false
      elsif dest_piece.color != self.color
        dest_piece.deactivate!()
      end
    end
    return true
  end

  def deactivate!
    self.update_attributes(active: false)
  end

  private

  def piece_at_location(x, y)
    return self.class.find_by(
      game_id: self.game_id,
      x_pos: x,
      y_pos: y,
      active: true)
  end
end
