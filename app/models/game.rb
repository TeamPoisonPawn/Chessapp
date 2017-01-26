class Game < ActiveRecord::Base
  validates :white_player_id, :presence => true, :if => "black_player_id.nil?"
  validates :black_player_id, :presence => true, :if => "white_player_id.nil?"
  has_many :pieces
  belongs_to :white_player, class_name: 'User'
  belongs_to :black_player, class_name: 'User'
  scope :available, -> { where("(black_player_id IS NOT NULL AND white_player_id IS NULL)
                                  OR (white_player_id IS NOT NULL AND black_player_id IS NULL)") }
  after_create :populate_board!
  after_create :set_default_turn
  after_create :assign_pieces

  #assign pieces to players id so opponent can't move pieces that are not their own.
  def assign_pieces
    pieces.where(color: "white").each do |p|
      p.update_attributes(player_id: white_player_id)
    end
    piece.where(color: "black").each do |p|
      p.update_attributes(player_id: black_player_id)
    end
  end
  #white player goes first
  def set_default_turn
    update_attributes(turn: white_player_id)
  end

  #switched game turn to color
  def switch_players(color)
    #ensure that game is set to correct turn
    if color
      update_attributes(turn: white_player_id)
    else
      update_attributes(turn: black_player_id)
    end
  end

  #update turn and game state after successdul move
  def update_state(current_player_color)
    # give turn over to other player
    switch_players(!current_player_color)
  end

  def populate_board!
    #Will need player ID, game_id, color, x_pos, and y_pos
    #white pawns (x_pos:0-7, y_pos:1)
    (0..7).each do |p|
      Pawn.create(:player_id => white_player_id, :game_id => self.id, :x_pos => p, :y_pos => 1, :color => "white", active: true)
    end
    #white rooks (left: 0,0 / right: 7,0)
    Rook.create(:player_id => white_player_id, :game_id => self.id, :x_pos => 0, :y_pos => 0, :color => "white", active: true)
    Rook.create(:player_id => white_player_id, :game_id => self.id, :x_pos => 7, :y_pos => 0, :color => "white", active: true)
    #white knights (left: 1,0 / right: 6,0)
    Knight.create(:player_id => white_player_id, :game_id => self.id, :x_pos => 1, :y_pos => 0, :color => "white", active: true)
    Knight.create(:player_id => white_player_id, :game_id => self.id, :x_pos => 6, :y_pos => 0, :color => "white", active: true)
    #white bishops (left: 2,0 / right: 5,0)
    Bishop.create(:player_id => white_player_id, :game_id => self.id, :x_pos => 2, :y_pos => 0, :color => "white", active: true)
    Bishop.create(:player_id => white_player_id, :game_id => self.id, :x_pos => 5, :y_pos => 0, :color => "white", active: true)
    #white queen (3,0)
    Queen.create(:player_id => white_player_id, :game_id => self.id, :x_pos => 3, :y_pos => 0, :color => "white", active: true)
    #white king (4,0)
    King.create(:player_id => white_player_id, :game_id => self.id, :x_pos => 4, :y_pos => 0, :color => "white", active: true)

    #black pawns (x_pos:0-7, y_pos:6)
    (0..7).each do |p|
      Pawn.create(:player_id => black_player_id, :game_id => self.id, :x_pos => p, :y_pos => 6, :color => "black", active: true)
    end
    #black rooks (left: 0,7 / right: 7,7)
    Rook.create(:player_id => black_player_id, :game_id => self.id, :x_pos => 0, :y_pos => 7, :color => "black", active: true)
    Rook.create(:player_id => black_player_id, :game_id => self.id, :x_pos => 7, :y_pos => 7, :color => "black", active: true)
    #black knights (left: 1,7 / right: 6,7)
    Knight.create(:player_id => black_player_id, :game_id => self.id, :x_pos => 1, :y_pos => 7, :color => "black", active: true)
    Knight.create(:player_id => black_player_id, :game_id => self.id, :x_pos => 6, :y_pos => 7, :color => "black", active: true)
    #black bishops (left: 2,7 / right: 5,7)
    Bishop.create(:player_id => black_player_id, :game_id => self.id, :x_pos => 2, :y_pos => 7, :color => "black", active: true)
    Bishop.create(:player_id => black_player_id, :game_id => self.id, :x_pos => 5, :y_pos => 7, :color => "black", active: true)
    #black queen (3,7)
    Queen.create(:player_id => black_player_id, :game_id => self.id, :x_pos => 3, :y_pos => 7, :color => "black", active: true)
    #black king (4,7)
    King.create(:player_id => black_player_id, :game_id => self.id, :x_pos => 4, :y_pos => 7, :color => "black", active: true)
  end
end
