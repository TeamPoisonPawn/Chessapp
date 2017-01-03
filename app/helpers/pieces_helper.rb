module PiecesHelper
  def hilight(piece)
    if current_page?(controller: 'pieces', action: 'show', id: piece.id)
      'hilight'
    elsif current_page?(controller: 'games', action: 'show', id: piece.game.id)
      ''
    else
      'inactive'
    end
  end

  def piece_link(piece)
    current_page?(controller: 'pieces', action: 'show', id: piece.id) ? 'active-link' : 'inactive'
  end
end
