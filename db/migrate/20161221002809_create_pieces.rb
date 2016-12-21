class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.integer :x_pos
      t.integer :y_pos
      t.string :piece_type
      t.string :color
      t.references :player, index: true

      t.timestamps
    end
  end
end
