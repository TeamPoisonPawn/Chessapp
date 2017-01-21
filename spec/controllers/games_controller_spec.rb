require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe "game#show action" do
    it "should successfully display the board if the game is found" do
      user = FactoryGirl.create(:user)
      sign_in user
      game = FactoryGirl.create(:game)
      get :show, id: game.id
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error if the game is not found" do
      user = FactoryGirl.create(:user)
      sign_in user
      get :show, id: 'notanid'
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "game#update action" do
    it "should successfully update the game's white_player_id if the user is not already in the game" do
      user = FactoryGirl.create(:user)
      sign_in user
      game = FactoryGirl.create(:game, black_player_id: 1, white_player_id: nil)
      put :update, id: game.id
      game.reload
      expect(response).to redirect_to game_path(game.id)
      expect(game.white_player_id).to eq user.id
    end
  end

end
