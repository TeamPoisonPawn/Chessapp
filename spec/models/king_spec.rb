require 'rails_helper'
RSpec.describe King, type: :model do

  describe "legal_move? method" do
    let(:king) { FactoryGirl.create(:king, x_pos: 5, y_pos: 5, game_id: 500) }

    context "up one space" do
      let(:x_dest) { 5 }
      let(:y_dest) { 6 }

      it "should return true when moving one spaces forward" do
        expect(king.legal_move?(x_dest, y_dest)).to be true
      end
    end

    context "left one space" do
      let(:x_dest) { 4 }
      let(:y_dest) { 5 }

      it "should return true when moving one space left" do
        expect(king.legal_move?(x_dest, y_dest)).to be true
      end
    end

    context "right one space" do
      let(:x_dest) { 6 }
      let(:y_dest) { 5 }

      it "should return true when moving one space right" do
        expect(king.legal_move?(x_dest, y_dest)).to be true
      end
    end

    context "down one space" do
      let(:x_dest) { 5 }
      let(:y_dest) { 4 }

      it "should return true when moving one space down" do
        expect(king.legal_move?(x_dest, y_dest)).to be true
      end
    end

    context "up-left diagonal" do
      let(:x_dest) { 4 }
      let(:y_dest) { 6 }

      it "should return true when moving up left diagonal" do
        expect(king.legal_move?(x_dest, y_dest)).to be true
      end
    end

    context "up-right diagonal" do
      let(:x_dest) { 6 }
      let(:y_dest) { 6 }

      it "should return true when moving up right diagonal" do
        expect(king.legal_move?(x_dest, y_dest)).to be true
      end
    end

    context "down-left diagonal" do
      let(:x_dest) { 4 }
      let(:y_dest) { 4 }

      it "should return true when moving down left diagonal" do
        expect(king.legal_move?(x_dest, y_dest)).to be true
      end
    end

    context "down-right diagonal" do
      let(:x_dest) { 6 }
      let(:y_dest) { 4 }

      it "should return true when moving down right diagonal" do
        expect(king.legal_move?(x_dest, y_dest)).to be true
      end
    end

    context "more than one space up" do
      let(:x_dest) { 5 }
      let(:y_dest) { 7 }

      it "should return false if moving more than one space up" do
        expect(king.legal_move?(x_dest, y_dest)).to be false
      end
    end

    context "more than one space left" do
      let(:x_dest) { 1 }
      let(:y_dest) { 5 }

      it "should return false if moving more than one space left" do
        king.update_attributes(x_pos: 5)
        expect(king.legal_move?(x_dest, y_dest)).to be false
      end
    end

    context "more than one space right" do
      let(:x_dest) { 7 }
      let(:y_dest) { 5 }

      it "should return false if moving more than one space right" do
        expect(king.legal_move?(x_dest, y_dest)).to be false
      end
    end

    context "more than one space down" do
      let(:x_dest) { 5 }
      let(:y_dest) { 1 }

      it "should return false if moving more than one space down" do
        king.update_attributes(y_pos: 5)
        expect(king.legal_move?(x_dest, y_dest)).to be false
      end
    end

    context "more than one space up-left diagonal" do
      let(:x_dest) { 3 }
      let(:y_dest) { 7 }

      it "should return false if moving more than one space up left diagonal" do
        king.update_attributes(x_pos: 5, y_pos: 5)
        expect(king.legal_move?(x_dest, y_dest)).to be false
      end
    end

    context "more than one space up-right diagonal" do
      let(:x_dest) { 7 }
      let(:y_dest) { 7 }

      it "should return false if moving more than one space up right diagonal" do
        king.update_attributes(y_pos: 5)
        expect(king.legal_move?(x_dest, y_dest)).to be false
      end
    end
    context "more than one space down-left diagonal" do
      let(:x_dest) { 3 }
      let(:y_dest) { 3 }

      it "should return false if moving more than one space down left diagonal" do
        king.update_attributes(x_pos: 5, y_pos: 5)
        expect(king.legal_move?(x_dest, y_dest)).to be false
      end
    end
    context "more than one space down-right diagonal" do
      let(:x_dest) { 7 }
      let(:y_dest) { 3 }

      it "should return false if moving more than one space down right diagonal" do
        king.update_attributes(x_pos: 5, y_pos: 5)
        expect(king.legal_move?(x_dest, y_dest)).to be false
      end
    end
  end
end
