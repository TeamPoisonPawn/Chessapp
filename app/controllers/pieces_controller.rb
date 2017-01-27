class PiecesController < ApplicationController
  before_action :find_piece, :only => [:show, :update]

  def update
    @game = @piece.game
    @pieces = @piece.game.pieces
    if @piece.move_to!(params[:x_pos], params[:y_pos])
      redirect_to game_path(@game.id)
    else
      flash.now[:alert] = "Piece cannot move there!"
      render "show"
    end
  end

  private

  def your_turn?
    @game.turn == current_player.id
  end

  def render_not_found
    render text: 'Not Found', status: :not_found
  end

  def find_piece
    begin
      @piece = Piece.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      return render_not_found
    end
  end

end
