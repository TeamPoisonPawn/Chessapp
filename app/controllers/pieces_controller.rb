class PiecesController < ApplicationController
  before_action :find_piece, :only => [:show, :update]
  def show
    @pieces = @piece.game.pieces
    return render_not_found if @piece.blank?
  end

  def update
    @game = @piece.game
    @pieces = @piece.game.pieces
    redirect_to game_path
  end

  private

  def render_not_found
    render text: 'Not Found', status: :not_found
  end

  def find_piece
    @piece = Piece.find(params[:id])
  end

end
