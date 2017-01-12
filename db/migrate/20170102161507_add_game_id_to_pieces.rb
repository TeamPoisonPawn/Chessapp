class AddGameIdToPieces < ActiveRecord::Migration
  def change
    add_reference :pieces, :game, index: true
  end
end
