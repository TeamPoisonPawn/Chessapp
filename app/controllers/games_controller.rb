class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_game, :only => [:show, :update]

  def show
    # if @game.check?("white")
    #   flash.now[:alert] = "Check!"
    # end
  end

  def update
    if @game.black_player_id.nil? && @game.white_player_id != current_user.id
      @game.update_attributes(black_player_id: current_user.id)
    elsif @game.white_player_id.nil? && @game.black_player_id != current_user.id
      @game.update_attributes(white_player_id: current_user.id)
    else
      flash.now[:alert] = "You are already a player in this game!"
    end
    render "show"
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
