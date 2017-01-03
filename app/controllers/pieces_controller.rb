class PiecesController < ApplicationController
  def show
    @piece = Piece.find_by_id(params[:id])
    return render_not_found if @piece.blank?
  end

  def update

  end

  private

  def render_not_found
    render text: 'Not Found', status: :not_found
  end

end
