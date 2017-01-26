class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(
      :name, :black_player_id, :white_player_id, :users, :status, :player_turn_id,
      :castle_w_kingside, :castle_w_queenside, :castle_b_kingside, :castle_b_queenside
    )
  end
end
