require 'rails_helper'

RSpec.describe Piece, type: :model do
  describe "is_obstructed? method" do
    it "should return false when no pieces on horizontal path" do
      piece = FactoryGirl.create(:piece, x_pos: 0, y_pos: 0)
      expect(piece.x_pos).to eq 0
    end
  end
end
