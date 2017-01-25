require 'rails_helper'

RSpec.describe Pawn, type: :model do

  describe "legal_move? method" do
    let(:game) { FactoryGirl.create(:game) }
    let(:pawn) { game.pieces.find_by(x_pos: 1, y_pos: 1, type: 'Pawn', color: "white", active: true) }

    context "up two spaces on first move" do
      let(:x_dest) { 1 }
      let(:y_dest) { 3 }

      it "should return true when moving two spaces forward on the first time it moves" do
        expect(pawn.legal_move?(x_dest, y_dest)).to be true
      end
    end

    context "up one space on first move" do
      let(:x_dest) { 1 }
      let(:y_dest) { 2 }

      it "should return true when moving one space forward on the first time it moves" do
        expect(pawn.legal_move?(x_dest, y_dest)).to be true
      end
    end

    context "up two spaces after first move" do
      let(:x_dest) { 1 }
      let(:y_dest) { 3 }

      it "should return false when moving two spaces forward after it has already moved" do
        pawn.update_attributes(has_moved: true)
        expect(pawn.legal_move?(x_dest, y_dest)).to be false
      end
    end

    context "up one space after first move" do
      let(:x_dest) { 1 }
      let(:y_dest) { 2 }

      it "should return true when moving one space forward after it has already moved" do
        pawn.update_attributes(has_moved: true)
        expect(pawn.legal_move?(x_dest, y_dest)).to be true
      end
    end

    context "up more than 2 spaces" do
      let(:x_dest) { 1 }
      let(:y_dest) { 4 }

      it "should return false when moving up more than two spaces" do
        expect(pawn.legal_move?(x_dest, y_dest)).to be false
      end
    end

    context "backwards" do
      let(:x_dest) { 1 }
      let(:y_dest) { 0 }

      it "should return false when moving backwards" do
        expect(pawn.legal_move?(x_dest, y_dest)).to be false
      end
    end

    context "forward right diagonal with enemy piece" do
      let(:x_dest) { 2 }
      let(:y_dest) { 2 }

      it "should return true if moving forward right diagonal if an enemy piece is on the destination" do
        FactoryGirl.create(:piece, x_pos: 2, y_pos: 2, color: "black", active: true, game_id: pawn.game.id)
        expect(pawn.legal_move?(x_dest, y_dest)).to be true
      end
    end

    context "forward left diagonal with enemy piece" do
      let(:x_dest) { 0 }
      let(:y_dest) { 2 }

      it "should return true if moving forward left diagonal if an enemy piece is on the destination" do
        FactoryGirl.create(:piece, x_pos: 0, y_pos: 2, color: "black", active: true, game_id: pawn.game.id)
        expect(pawn.legal_move?(x_dest, y_dest)).to be true
      end
    end

    context "forward right diagonal with friendly piece" do
      let(:x_dest) { 2 }
      let(:y_dest) { 2 }

      it "should return false if moving forward right diagonal if a friendly piece is on the destination" do
        FactoryGirl.create(:piece, x_pos: 2, y_pos: 2, color: "white", active: true, game_id: pawn.game.id)
        expect(pawn.legal_move?(x_dest, y_dest)).to be false
      end
    end

    context "forward left diagonal with friendly piece" do
      let(:x_dest) { 0 }
      let(:y_dest) { 2 }

      it "should return false if moving forward left diagonal if a friendly piece is on the destination" do
        FactoryGirl.create(:piece, x_pos: 0, y_pos: 2, color: "white", active: true, game_id: pawn.game.id)
        expect(pawn.legal_move?(x_dest, y_dest)).to be false
      end
    end
  end
end
