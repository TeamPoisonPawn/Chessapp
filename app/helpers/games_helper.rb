module GamesHelper
  def white_or_black(row)
    row % 2 != 0 ? cycle('black', 'white') : cycle('white', 'black')
  end

end
