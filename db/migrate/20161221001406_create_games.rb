class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :status
      t.string :title

      t.timestamps
    end
  end
end
