class AddTypeToPiece < ActiveRecord::Migration
  def change
    add_column :pieces, :type, :string
  end
end
