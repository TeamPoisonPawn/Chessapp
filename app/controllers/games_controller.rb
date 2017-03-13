class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_game, :only => [:show, :update]

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
    if @game.valid?
      redirect_to game_path(@game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    if @game.white_player_id.nil? || @game.black_player_id.nil?
      flash.now[:alert] = "Waiting for Opponent"
    end
    if @game.check?("white")
      flash.now[:alert] = "White Check!"
    end
    if @game.check?("black")
      flash.now[:alert] = "Black Check!"
    end
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

  def game_params
    params.require(:game).permit(:title, :white_player_id)
  end

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
