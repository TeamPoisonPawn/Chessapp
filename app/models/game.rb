class Game < ActiveRecord::Base
  has_many :user_games
  has_many :users, through: :user_games
  has_many :pieces

  def white_player
    user_games.white.first.try(:user)
  end

  def black_player
    user_games.where(color: 'black').first.try(:user)
  end
end
