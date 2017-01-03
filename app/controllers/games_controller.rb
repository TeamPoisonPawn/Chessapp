class GamesController < ApplicationController
  def show
    @piece = Piece.first
    @pieces = Piece.all
  end
end
