require 'rails_helper'
#how to run:
#bundle exec rspec
#bin/rspec
#rspec spec/____(file name) // :15(if you want to run specific tests)

RSpec.describe Game, type: :model do

  describe "#populate_board!" do
    let(:game){FactoryGirl.create(:game)}
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

  describe "player's turn" do
    let(:game) { FactoryGirl.create(:game, white_player_id: white_player.id, black_player_id: black_player.id) }
    let(:piece) { FactoryGirl.create(:piece, game_id: game.id, player_id: white_player.id) }
    let(:pawn) { FactoryGirl.create(:pawn, game_id: game.id, player_id: black_player.id) }

    it "should set the first turn of a player to white" do
      game.set_default_turn!
      expect(game.current_turn).to eq(white_player.id)
    end

    it "should set the current turn to the correct player" do
      game.set_default_turn!
      expect(game.current_player_turn).to eq('white')
      piece.move_to(5,5)
      game.reload
      expect(game.current_player_turn).to eq('black')
    end

    it "should change turns after player moves" do
      game.set_default_turn!
      expect(game.current_turn).to eq(white_player.id)
      piece.move_to(5,5)
      game.reload
      expect(game.current_turn).to eq(black_player.id)
    end
  end
end

#notes:
#add a :type(name) column; have the name of the pieces as the type. For piece and have it have a rook so we can actually run tests
#how is a piece going to be distinguished? How do we know its a Rook? Or just a piece?

#Piece(is a model), calling a method so its a class method.
#
