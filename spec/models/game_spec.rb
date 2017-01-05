require 'rails_helper'
#how to run:
#bundle exec rspec
#bin/rspec
#rspec spec/____(file name) // :15(if you want to run specific tests)

RSpec.describe Game, type: :model do
  let(:game){FactoryGirl.create(:game)}
  describe "#populate_board!" do
    it "should populate our game board with all chess pieces"
      game.populate_board!
      expect(game.pieces.count).to eq(32)
    end
    #this is another way to run our test when we are checking if the game is populating.

    it "text" do
      expect{
        game.populate_board!
      }.to change{pieces.count}.by(32)
    end

    #
    # it "should have rooks on (0,0), (0,7)"
    #   game = FactoryGirl.create(:game)


  end

#notes:
#add a :type(name) column; have the name of the pieces as the type. For piece and have it have a rook so we can actually run tests
#how is a piece going to be distinguished? How do we know its a Rook? Or just a piece?
#
