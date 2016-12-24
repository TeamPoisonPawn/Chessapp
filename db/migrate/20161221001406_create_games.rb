class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :status
      t.string :title
      t.references :winning_player, index: true

      t.timestamps
    end
  end
end
