require 'rails_helper'

RSpec.describe Piece, type: :model do
  describe "is_obstructed? method" do
    it "should return false when no pieces on horizontal path" do
      piece = FactoryGirl.create(:piece, x_pos: 0, y_pos: 0)
      #expect(piece.is_obstructed?(5,0)).to be false
    end

    it "should return false when no pieces on vertical path" do
      game = FactoryGirl.create(:game)
      piece = FactoryGirl.create(:piece, x_pos: 0, y_pos: 0, game_id: game.id)
      expect(piece.is_obstructed?(0,5)).to be false
    end

    it "should return false when no pieces on diagonal path" do

    end

    it "should return true when another piece is on the horizontal path" do

    end

    it "should return false when a piece is on the horizontal path destination" do

    end

    it "should return false when a piece is on the vertical path destination" do

    end

    it "should return false when a piece is on the diagonal path detaination" do

    end

    it "should return true when another piece is on the vertical path" do

    end

    it "should return true when another piece is on the diagonal path" do

    end

    it "should raise an error when the path is invalid" do

    end
  end
end
