class Piece < ActiveRecord::Base
  belongs_to :game
  belongs_to :user

  def self.pieces
    %w(Pawn Rook Bishop Knight Queen King)
  end

  #should have a side eg. white or black
  #functionality of all the unique pieces
  #how far pieces can move. special cases for all.

  #determine if piece is obstructed to move
  def is_obstructed?(x_destination, y_destination)
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
    elsif (x_location - x_destination).abs == (y_location - y_destination).abs
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
end