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
    #white pawns (8)
    #white rooks
    #white bishops
    #white knights
    #white king
    #white queen

    #black pawns (8)
    #black rooks
    #black bishops
    #black knights
    #black king
    #black queen
  end