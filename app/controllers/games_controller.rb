class GamesController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def update
    @game.update_attributes(black_player_id: current_user.id) if !@game.black_player_id
    @game.update_attributes(white_player_id: current_user.id) if !@game.white_player_id
  end

  private

  def render_not_found
    render text: 'Not Found', status: :not_found
  end

  def find_game
    begin
      @game = Game.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      return render_not_found
    end
  end
end
