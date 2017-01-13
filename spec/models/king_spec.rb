require 'rails_helper'
#King test only passes when commenting out the entire initialize block.
RSpec.describe King, type: :model do
  game = FactoryGirl.create(:game)
  game.pieces.delete_all
  let(:king) {FactoryGirl.create(:king, x_pos: 3, y_pos: 0, game: game, color: 'white')}
  describe '.can_move?' do
    it "should allow the King to move vertical" do
      expect(king.can_move?(3, 1)).to eq true
    end
    it "should allow the King to move horizontal" do
      expect(king.can_move?(4,0)).to eq true
    end
    it "should allow the King to move diagonally" do
      expect(king.can_move?(4,1)).to eq true
    end
    it "should not allow the king to move more than one space" do
      expect(king.can_move?(3,2)).to eq false
    end
  end
end
