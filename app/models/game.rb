class Game < ActiveRecord::Base
  validates :white_player_id, :presence => true, :if => "black_player_id.nil?"
  validates :black_player_id, :presence => true, :if => "white_player_id.nil?"
  has_many :pieces
  belongs_to :white_player, class_name: 'User'
  belongs_to :black_player, class_name: 'User'
  scope :available, -> { where("(black_player_id IS NOT NULL AND white_player_id IS NULL)
                                  OR (white_player_id IS NOT NULL AND black_player_id IS NULL)") }

  def populate_board!
    #Will need player ID, game_id, color, x_pos, and y_pos
    #white pawns (x_pos:0-7, y_pos:1)
    (0..7).each do |p|
      Pawn.create(:player_id => white_player_id, :game_id => self.id, :x_pos => p, :y_pos => 1, :color => 1)
    end
    #white rooks (left: 0,0 / right: 7,0)
    Rook.create(:player_id => white_player_id, :game_id => self.id, :x_pos => 0, :y_pos => 0, :color => 1)
    Rook.create(:player_id => white_player_id, :game_id => self.id, :x_pos => 7, :y_pos => 0, :color => 1)
    #white knights (left: 1,0 / right: 6,0)
    Knight.create(:player_id => white_player_id, :game_id => self.id, :x_pos => 1, :y_pos => 0, :color => 1)
    Knight.create(:player_id => white_player_id, :game_id => self.id, :x_pos => 6, :y_pos => 0, :color => 1)
    #white bishops (left: 2,0 / right: 5,0)
    Bishop.create(:player_id => white_player_id, :game_id => self.id, :x_pos => 2, :y_pos => 0, :color => 1)
    Bishop.create(:player_id => white_player_id, :game_id => self.id, :x_pos => 5, :y_pos => 0, :color => 1)
    #white queen (3,0)
    Queen.create(:player_id => white_player_id, :game_id => self.id, :x_pos => 3, :y_pos => 0, :color => 1)
    #white king (4,0)
    King.create(:player_id => white_player_id, :game_id => self.id, :x_pos => 4, :y_pos => 0, :color => 1)

    #black pawns (x_pos:0-7, y_pos:6)
    (0..7).each do |p|
      Pawn.create(:player_id => black_player_id, :game_id => self.id, :x_pos => p, :y_pos => 6, :color => 0)
    end
    #black rooks (left: 0,7 / right: 7,7)
    Rook.create(:player_id => black_player_id, :game_id => self.id, :x_pos => 0, :y_pos => 7, :color => 0)
    Rook.create(:player_id => black_player_id, :game_id => self.id, :x_pos => 7, :y_pos => 7, :color => 0)
    #black knights (left: 1,7 / right: 6,7)
    Knight.create(:player_id => black_player_id, :game_id => self.id, :x_pos => 1, :y_pos => 7, :color => 0)
    Knight.create(:player_id => black_player_id, :game_id => self.id, :x_pos => 6, :y_pos => 7, :color => 0)
    #black bishops (left: 2,7 / right: 5,7)
    Bishop.create(:player_id => black_player_id, :game_id => self.id, :x_pos => 2, :y_pos => 7, :color => 0)
    Bishop.create(:player_id => black_player_id, :game_id => self.id, :x_pos => 5, :y_pos => 7, :color => 0)
    #black queen (3,7)
    Queen.create(:player_id => black_player_id, :game_id => self.id, :x_pos => 3, :y_pos => 7, :color => 0)
    #black king (4,7)
    King.create(:player_id => black_player_id, :game_id => self.id, :x_pos => 4, :y_pos => 7, :color => 0)
  end
end
