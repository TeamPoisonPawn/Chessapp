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
      expect(response).should render_template(:show)
      expect(game.white_player_id).to eq user.id
    end
    it "should successfully update the game's black_player_id if the user is not already in the game" do
      user = FactoryGirl.create(:user)
      sign_in user
      game = FactoryGirl.create(:game, black_player_id: nil, white_player_id: 1)
      put :update, id: game.id
      game.reload
      expect(response).should render_template(:show)
      expect(game.black_player_id).to eq user.id
    end
    it "should display an error if a user tries to join a game they are already in" do
      user = FactoryGirl.create(:user)
      sign_in user
      game = FactoryGirl.create(:game, black_player_id: user.id, white_player_id: nil)
      put :update, id: game.id
      game.reload
      expect(response).should render_template(:show)
      expect(flash[:alert]).to be_present
      expect(game.white_player_id).to be nil
    end
  end

end
