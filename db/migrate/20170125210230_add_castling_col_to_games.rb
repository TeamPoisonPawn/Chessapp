class AddCastlingColToGames < ActiveRecord::Migration
  def change
    add_column :games, :castle_w_kingside, :integer
    add_column :games, :castle_w_queenside, :integer
    add_column :games, :castle_b_kingside, :integer
    add_column :games, :castle_b_queenside, :integer
  end
end
