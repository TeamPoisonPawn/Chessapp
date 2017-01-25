require 'rails_helper'

RSpec.describe Bishop, type: :model do
  game = FactoryGirl.create(:game)
  game.pieces.delete_all
  bishop = FactoryGirl.create(:bishop, x_pos: 2, y_pos: 0, game: game)
  describe 'valid_move?' do
    it "should not allow the bishop to move horizontally" do
      expect(bishop.valid_move?(3,0)).to eq false
    end
    it "should not allow the bishop to move vertically" do
      expect(bishop.valid_move?(2,1)).to eq false
    end
    it "should allow the bishop to move diagonally" do
      expect(bishop.valid_move?(4,2)).to eq true
    end
  end
end
