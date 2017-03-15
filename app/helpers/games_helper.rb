module GamesHelper

  def white_or_black(row)
    row % 2 != 0 ? cycle('white', 'black') : cycle('black', 'white')
  end


end
