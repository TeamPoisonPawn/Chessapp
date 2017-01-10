require 'rails_helper'

RSpec.describe PiecesController, type: :controller do
  describe "piece#show action" do
    it "should successfully display the board if the piece is found" do
      piece = FactoryGirl.create(:piece)
      get :show, id: piece.id
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error if the piece is not found" do
      get :show, id: 'notanid'
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "piece#update action" do
    it "should successfully update the position of the piece" do
      game = FactoryGirl.create(:game)
      piece = FactoryGirl.create(:piece, game_id: game.id, x_pos: 0, y_pos: 0)
      put :update, id: piece.id, :x_pos => 0, :y_pos => 5
      piece.reload
      expect(response).to redirect_to game_path(game.id)
      expect(piece.x_pos).to eq 0
      expect(piece.y_pos).to eq 5
    end
  end
end
