class AddActiveToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :active, :boolean
  end
end
