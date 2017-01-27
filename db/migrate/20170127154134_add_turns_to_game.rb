class AddTurnsToGame < ActiveRecord::Migration
  def change
    add_column :games, :turn, :integer
  end
end
