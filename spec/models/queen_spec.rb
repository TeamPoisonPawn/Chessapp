require 'rails_helper'

RSpec.describe Queen, type: :model do
  game = FactoryGirl.create(:game)

  describe "Queen#valid_move?" do
    let(:queen) {FactoryGirl.create(:queen, x_pos: 4, y_pos: 4, game_id: game.id, color: "white", active: true)}

    subject { queen.valid_move?(x_destination, y_destination) }

    context "invalid" do

      let(:x_destination) { 3 }
      let(:y_destination) { 2 }

      it "should be false if its an invalid move" do
        expect(subject).to eq(false)
      end
    end

    context "move is nil" do

      let(:x_destination) { 4 }
      let(:y_destination) { 4 }

      it "should be false if piece doesn't move" do
        expect(subject).to eq(false)
      end
    end

    context "up" do

      let(:x_destination) { 4 }
      let(:y_destination) { 6 }

      it "should be a valid move" do
        expect(subject).to eq(true)
      end

      it "should return false if queen is obstructed" do
        piece = FactoryGirl.create(:piece, x_pos: 4, y_pos: 5, game_id: game.id, color: "white", active: true)
          expect(subject).to eq(false)
      end
    end

    context "down" do
      let(:x_destination) { 4 }
      let(:y_destination) { 2 }

      it "should be a valid move" do
        expect(subject).to eq(true)
      end

      it "should return false if queen is obstructed" do
        piece = FactoryGirl.create(:piece, x_pos: 4, y_pos: 3, game_id: game.id, color: "white", active: true)
        expect(subject).to eq(false)
      end
    end

    context "right" do

      let(:x_destination) { 6 }
      let(:y_destination) { 4 }

      it "should be a valid move" do
        expect(subject).to eq(true)
      end

      it "should return false if queen is obstructed" do
        piece = FactoryGirl.create(:piece, x_pos: 5, y_pos: 4, game_id: game.id, color: "white", active: true)
        expect(subject).to eq(false)
      end
    end

    context "left" do

      let(:x_destination) { 2 }
      let(:y_destination) { 4 }

      it "should be a valid move" do
        expect(subject).to eq(true)
      end

      it "should return false if queen is obstructed" do
        piece = FactoryGirl.create(:piece, x_pos: 3, y_pos: 4, game_id: game.id, color: "white", active: true)
        expect(subject).to eq(false)
      end
    end

    context "up and left" do

      let(:x_destination) { 2 }
      let(:y_destination) { 6 }

      it "should be a valid move" do
        expect(subject).to eq(true)
      end

      it "should return false if queen is obstructed" do
        piece = FactoryGirl.create(:piece, x_pos: 3, y_pos: 5, game_id: game.id, color: "white", active: true)
        expect(subject).to eq(false)
      end
    end
  end
end   