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
      piece = FactoryGirl.create(:piece, x_pos: 0, y_pos: 0)
      patch :update, id: piece.id, piece: {x_pos: 1, y_pos: 1}
      expect(response).to redirect_to game_path
      piece.reload
      expect(piece.x_pos).to eq 1
      expect(piece.y_pos).to eq 1
    end
  end
end
