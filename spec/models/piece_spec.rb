require 'rails_helper'

RSpec.describe Piece, type: :model do

  let(:game) { FactoryGirl.create(:game) }
  let(:piece) { FactoryGirl.create(:piece, x_pos: 4, y_pos: 4, game_id: game.id) }

  describe "is_obstructed? method" do

    subject { piece.is_obstructed?(x_destination, y_destination) }

    context "right" do
      let(:x_destination) { 7 }
      let(:y_destination) { 4 }

      it "should return false when no pieces on horizontal path" do
        expect(subject).to be false
      end

      it "should return true when another piece is on the horizontal path" do
        FactoryGirl.create(:piece, x_pos: 6, y_pos: 4, game_id: game.id)
        expect(subject).to be true 
      end
    end

    context "left" do
      let (:x_destination) { 0 }
      let (:y_destination) { 4 }

      it "should return false when no pieces on horizontal path" do
        expect(subject).to be false
      end

      it "should return true when another piece is on the horizontal path" do
        FactoryGirl.create(:piece, x_pos: 1, y_pos: 4, game_id: game.id)
        expect(subject).to be true
      end
    end

    context "up" do
      let(:x_destination) { 4 }
      let(:y_destination) { 7 }

      it "should return false when no pieces on vertical path" do
        expect(subject).to be false
      end

      it "should return true when piece on vertical path" do
        FactoryGirl.create(:piece, x_pos: 4, y_pos: 6, game_id: game.id)
        expect(subject).to be true
      end
    end

    context "down" do
      let(:x_destination) { 4 }
      let(:y_destination) { 0 }

      it "should return false when no pieces on vertical path" do
        expect(subject).to be false
      end

      it "should return true when another piece is on vertical path" do
        FactoryGirl.create(:piece, x_pos: 4, y_pos: 1, game_id: game.id)
        expect(subject).to be true
      end
    end

    context "up and right" do
      let(:x_destination) { 7 }
      let(:y_destination) { 7 }

      it "should return flase when no pices are on diagonal path" do
        expect(subject).to be false
      end

      it "should return true when another piece is on vertical path" do
        FactoryGirl.create(:piece, x_pos: 6, y_pos: 6, game_id: game.id)
        expect(subject).to be true
      end
    end

    context "down and left" do
      let(:x_destination) { 0 }
      let(:y_destination) { 0 }

      it "should return false when no pieces are on diagonal path" do
        expect(subject).to be false
      end

      it "should return true when another piece is on diagonal path" do
        FactoryGirl.create(:piece, x_pos: 2, y_pos: 2, game_id: game.id)
        expect(subject).to be true
      end
    end
  end
end