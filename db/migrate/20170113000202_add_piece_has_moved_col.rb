class AddPieceHasMovedCol < ActiveRecord::Migration
  def change
    add_column :pieces, :has_moved, :boolean
  end
end
