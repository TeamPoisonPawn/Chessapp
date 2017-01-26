require 'rails_helper'
#how to run:
#bundle exec rspec
#bin/rspec
#rspec spec/____(file name) // :15(if you want to run specific tests)

RSpec.describe Game, type: :model do
  let(:game){FactoryGirl.create(:game)}
  describe "#populate_board!" do
    it "should populate our game board with all chess pieces" do
      expect(game.pieces.count).to eq(32) #game.pieces is an association.
    end
    #If you define your own class-specific method, you can call these methods on the class.
    #this is another way to run our test when we are checking if the game is populating.
    #Another way to write game.pieces.count can be "Piece.where(game_id: game:id).count"
    it "should populate our game board" do
      expect{
        game
      }.to change{Piece.count}.by(32)
    end

    #
    # it "should have rooks on (0,0), (0,7)"
    #   game = FactoryGirl.create(:game)

  end

  describe "check?" do
    it "should return true if remaining enemy pieces can capture king" do
      game = FactoryGirl.create(:game)
      queen_black = game.pieces.find_by type: 'Queen', color: "black"
      king_white = game.pieces.find_by type: 'King', color: "white"
      queen_black.move_to!(5,5)
      king_white.move_to!(5,4)
      expect(game.check?(king_white.color)).to be true
    end

    it "should return false if remaining enemy pieces cannot capture king" do
      game = FactoryGirl.create(:game)
      expect(game.check?("white")).to be false
    end

  end
end

#notes:
#add a :type(name) column; have the name of the pieces as the type. For piece and have it have a rook so we can actually run tests
#how is a piece going to be distinguished? How do we know its a Rook? Or just a piece?

#Piece(is a model), calling a method so its a class method.
#
