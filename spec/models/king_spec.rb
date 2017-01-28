require 'rails_helper'
RSpec.describe King, type: :model do
  game = FactoryGirl.create(:game)
  game.pieces.delete_all
  let(:king) {FactoryGirl.create(:king, x_pos: 3, y_pos: 0, game: game, color: 'white')}
  describe '.legal_move?' do
    it "should allow the King to move vertical" do
      expect(king.legal_move?(3, 1)).to eq true
    end
    it "should allow the King to move horizontal" do
      expect(king.legal_move?(4,0)).to eq true
    end
    it "should allow the King to move diagonally" do
      expect(king.legal_move?(4,1)).to eq true
    end
    it "should not allow the king to move more than one space" do
      expect(king.legal_move?(3,2)).to eq false
    end
  end
  describe 'will_move_into_check?' do
    it "should return false if the king is not moving into check" do
      queen = FactoryGirl.create(:queen, x_pos: 5, y_pos: 1, type: 'Queen', color: 'black')
      expect(king.will_move_into_check?(2,0)).to be false
    end
    it "should return true if the king is moving into check" do
      queen = FactoryGirl.create(:queen, x_pos: 5, y_pos: 1, type: 'Queen', color: 'black', game: king.game)
      expect(king.will_move_into_check?(4,0)).to be true
    end
  end
  describe 'can_move_out_of_check?' do
    let(:king) {FactoryGirl.create(:king, x_pos: 7, y_pos: 7, game: game, color: 'white')}
    it "should return true if the king can move to a square that does not put it in check" do
      queen = FactoryGirl.create(:queen, x_pos: 6, y_pos: 4, type: 'Queen', color: 'black', game: king.game)
      expect(king.can_move_out_of_check?).to be true
    end
    it "should return false if the king can only move into check" do
      queen = FactoryGirl.create(:queen, x_pos: 6, y_pos: 5, type: 'Queen', color: 'black', game: king.game)
      enemy_king = FactoryGirl.create(:king, x_pos: 5, y_pos: 6, color: 'black', game: king.game)
      expect(king.can_move_out_of_check?).to be false
    end
  end
end
