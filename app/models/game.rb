class Game < ActiveRecord::Base
  validates :white_player_id, :presence => true, :if => "black_player_id.nil?"
  validates :black_player_id, :presence => true, :if => "white_player_id.nil?"
  has_many :pieces
  belongs_to :white_player, class_name: 'User'
  belongs_to :black_player, class_name: 'User'
  scope :available, -> { where("(black_player_id IS NOT NULL AND white_player_id IS NULL)
                                  OR (white_player_id IS NOT NULL AND black_player_id IS NULL)") }
end

  def initialize_board!
    #Will need player ID, game_id, color, x_pos, and y_pos
    #white pawns (x_pos:0-7, y_pos:1)
    #white rooks (left: 0,0 / right: 7,0)
    #white knights (left: 1,0 / right: 6,0)
    #white bishops (left: 2,0 / right: 5,0)
    #white king (3,0)
    #white queen (2,0)

    #black pawns (x_pos:0-7, y_pos:6)
    #black rooks (left: 0,7 / right: 7,7)
    #black knights (left: 1,7 / right: 6,7)
    #black bishops (left: 2,7 / right: 5,7)
    #black king (3,7)
    #black queen (2,7)
  end