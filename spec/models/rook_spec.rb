require 'rails_helper'
#again, test only runs if initialize is commented out.
RSpec.describe Rook, type: :model do
  game = FactoryGirl.create(:game)
  game.pieces.delete_all
  let(:rook) {FactoryGirl.create(:rook, x_pos: 0, y_pos: 0, game: game, color: 'white')}
  describe 'can_move?' do
    it "should not allow the rook to move diagonally" do
      expect(rook.can_move?(1,1)).to eq false
    end
    it "should allow the rook to move vertically" do
      expect(rook.can_move?(0,3)).to eq true
    end
    it "should allow the rook to move horizontally" do
      expect(rook.can_move?(4,0)).to eq true
    end
  end
end
