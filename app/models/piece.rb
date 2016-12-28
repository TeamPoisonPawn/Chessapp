class Piece < ActiveRecord::Base
  belongs_to :game

  def self.pieces
    %w(Pawn Rook Bishop Knight Queen King)
  end

  #should have a side eg. white or black
  #functionality of all the unique pieces
  #how far pieces can move. special cases for all. 
end
