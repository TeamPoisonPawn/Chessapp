class AddPlayerColorId < ActiveRecord::Migration
  def change
    add_reference :games, :white_player, index: true
    add_reference :games, :black_player, index: true
    add_reference :games, :player_turn, index: true
  end
end
