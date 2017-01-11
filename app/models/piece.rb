class Piece < ActiveRecord::Base
  belongs_to :game
  belongs_to :user
  scope :rooks, -> {
    where
  }

  #we could just put, and not put that into each unique piece.
  # after_initialize do
  #   if color == 1
  #     write_attribute(:piece_type, "white-#{type.downcase}.jpg")
  #   else
  #     write_attribute(:piece_type, "black-#{type.downcase}.jpg")
  #   end
  # end

  def self.pieces
    %w(Pawn Rook Bishop Knight Queen King)
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
        if game.pieces.where(y_pos: y_location, x_pos: x_position).any?
          return true
        end
        x_position += incrementer
      end
      return false
    #check for diagnol obstructions
    else
      raise error if(x_location - x_destination).abs != (y_location - y_destination).abs
      x_location > x_destination ? x_incrementer = -1 : x_incrementer = 1
      y_location > y_destination ? y_incrementer = -1 : y_incrementer = 1
      x_position = x_location + x_incrementer
      y_position = y_location + y_incrementer
      while x_position != x_destination && y_position != y_destination
        if games.pieces.where(x_pos: x_position, y_pos: y_position).any?
          return true
        end
        x_position += x_incrementer
        y_position += y_incrementer
      end
      return false
    end
  end

  def move_to!(x_dest, y_dest)
    x_old = self.x_pos
    y_old = self.y_pos
    my_color = self.color

    dest_piece = Piece.find_by(game_id: self.game.id, x_pos: x_dest, y_pos: y_dest, active: true)

    if !dest_piece
      self.update_attributes(x_pos: x_dest, y_pos: y_dest)
      return true
    elsif dest_piece.color != my_color
      dest_piece.update_attributes(active: false)
      self.update_attributes(x_pos: x_dest, y_pos: y_dest)
      true
    else
      return false
    end
  end
end
