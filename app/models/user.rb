class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :game
  has_many :pieces

  def all_games
    Game.where('white_player_id = ? OR black_player_id = ?', self.id, self.id)
  end

  def black_games
    Game.where('black_player_id = ?', self.id)
  end

  def white_games
    Game.where('white_player_id = ?', self.id)
  end
end
