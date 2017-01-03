class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @piece = @game.pieces.first
    @pieces = @game.pieces
  end
end
