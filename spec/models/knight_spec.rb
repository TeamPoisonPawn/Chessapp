require 'rails_helper'

RSpec.describe Knight, type: :model do

  describe "legal_move? method" do

    it "should return true if the destination is not on the current column or row and is 3 spaces away" do
      game = FactoryGirl.create(:game)
      knight = game.pieces.find_by x_pos: 1, y_pos: 0
      expect(knight.legal_move?(0,2)).to be true
    end

    it "should return false if the destination is on the current column and is 3 spaces away" do
      game = FactoryGirl.create(:game)
      knight = game.pieces.find_by x_pos: 1, y_pos: 0
      expect(knight.legal_move?(1,3)).to be false
    end

    it "should return false if the destination is on the current row and is 3 spaces away" do
      game = FactoryGirl.create(:game)
      knight = game.pieces.find_by x_pos: 1, y_pos: 0
      expect(knight.legal_move?(4,0)).to be false
    end

    it "should return false if the destination is not on the current column or row and is not 3 spaces away" do
      game = FactoryGirl.create(:game)
      knight = game.pieces.find_by x_pos: 1, y_pos: 0
      expect(knight.legal_move?(3,2)).to be false
    end

  end

end