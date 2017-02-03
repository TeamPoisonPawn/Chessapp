class RemovePieceTypeColFromPiece < ActiveRecord::Migration
  def change
    remove_column :pieces, :piece_type
  end
end
