require 'rails_helper'

RSpec.describe Piece, type: :model do

  let(:game) { FactoryGirl.create(:game) }
  let(:piece) { FactoryGirl.create(:piece, x_pos: 4, y_pos: 4, game_id: game.id) }

  # describe "is_obstructed? method" do

  #   subject { piece.is_obstructed?(x_destination, y_destination) }

  #   context "right" do
  #     let(:x_destination) { 6 }
  #     let(:y_destination) { 4 }

  #     it "should return false when no pieces on horizontal path" do
  #       expect(subject).to be false
  #     end

  #     it "should return true when another piece is on the horizontal path" do
  #       FactoryGirl.create(:piece, x_pos: 5, y_pos: 4, game_id: game.id)
  #       expect(subject).to be true 
  #     end
  #   end

  #   context "left" do
  #     let (:x_destination) { 0 }
  #     let (:y_destination) { 4 }

  #     it "should return false when no pieces on horizontal path" do
  #       expect(subject).to be false
  #     end

  #     it "should return true when another piece is on the horizontal path" do
  #       FactoryGirl.create(:piece, x_pos: 1, y_pos: 4, game_id: game.id)
  #       expect(subject).to be true
  #     end
  #   end

  #   context "up" do
  #     let(:x_destination) { 4 }
  #     let(:y_destination) { 6 }

  #     it "should return false when no pieces on vertical path" do
  #       expect(subject).to be false
  #     end

  #     it "should return true when piece on vertical path" do
  #       FactoryGirl.create(:piece, x_pos: 4, y_pos: 5, game_id: game.id)
  #       expect(subject).to be true
  #     end
  #   end

  #   context "down" do
  #     let(:piece) { FactoryGirl.create(:piece, x_pos: 5, y_pos: 5, game_id: game.id) }
  #     let(:x_destination) { 5 }
  #     let(:y_destination) { 3 }

  #     it "should return false when no pieces on vertical path" do
  #       expect(subject).to be false
  #     end

  #     it "should return true when another piece is on vertical path" do
  #       FactoryGirl.create(:piece, x_pos: 5, y_pos: 4, game_id: game.id)
  #       expect(subject).to be true
  #     end
  #   end

  #   context "up and right" do
  #     let(:x_destination) { 6 }
  #     let(:y_destination) { 6 }

  #     it "should return false when no pieces are on diagonal path" do
  #       expect(subject).to be false
  #     end

  #     it "should return true when another piece is on vertical path" do
  #       FactoryGirl.create(:piece, x_pos: 5, y_pos: 5, game_id: game.id)
  #       expect(subject).to be true
  #     end
  #   end

  #   context "down and left" do
  #     let(:x_destination) { 2 }
  #     let(:y_destination) { 2 }

  #     it "should return false when no pieces are on diagonal path" do
  #       expect(subject).to be false
  #     end

  #     it "should return true when another piece is on diagonal path" do
  #       FactoryGirl.create(:piece, x_pos: 3, y_pos: 3, game_id: game.id)
  #       expect(subject).to be true
  #     end
  #   end
  # end

  # describe "move_to! method" do
  #   it "should return true and change the piece's position if no piece is on the destination" do
  #     game = FactoryGirl.create(:game)
  #     piece = FactoryGirl.create(:piece, x_pos: 0, y_pos: 0, game_id: game.id)
  #     expect(piece.move_to!(1,3)).to be true
  #     expect(piece.x_pos).to eq(1)
  #     expect(piece.y_pos).to eq(3)
  #   end

  #   it "should return true, change the piece's position, and set the enemy piece inactive if an enemy piece is on the destination" do
  #     game = FactoryGirl.create(:game)
  #     piece1 = FactoryGirl.create(:piece, x_pos: 0, y_pos: 0, game_id: game.id, color: "white", active: true)
  #     piece2 = FactoryGirl.create(:piece, x_pos: 2, y_pos: 2, game_id: game.id, color: "black", active: true)
  #     expect(piece1.move_to!(2,2)).to be true
  #     piece2.reload
  #     expect(piece1.x_pos).to eq(2)
  #     expect(piece1.y_pos).to eq(2)
  #     expect(piece2.active).to be false

  #   end

  #   it "should return false and not change the piece's position if a piece of the same color occupies the destination" do
  #     game = FactoryGirl.create(:game)
  #     piece1 = FactoryGirl.create(:piece, x_pos: 0, y_pos: 0, game_id: game.id, color: "white", active: true)
  #     piece2 = FactoryGirl.create(:piece, x_pos: 2, y_pos: 2, game_id: game.id, color: "white", active: true)
  #     expect(piece1.move_to!(2,2)).to be false
  #   end
  # end

  describe "Piece#game.change_turns" do

    let(:piece) { FactoryGirl.create(:piece, game_id: game.id, player_id: white_player.id) }

    it "should change turns after a player moves piece" do
      game.set_default_turn
      expect(game.turn).to eq(white_player.id)
      piece.move_to(5,5)
      game.reload
      expect(game.turn).to eq(black_player.id)
    end
  end

  
end
