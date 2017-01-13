FactoryGirl.define do
  factory :piece do
    x_pos 0
    y_pos 0
    game_id 1
    active true
    color "black"
  end
  factory :game do
    white_player_id 1

  end

  factory :pawn do
  end

  factory :king do
    x_pos 3
    y_pos 0
  end

  factory :rook do
    x_pos 0
    y_pos 0
  end

  factory :bishop do
    x_pos 2
    y_pos 0
  end

  factory :knight do
  end

  factory :queen do
  end
end
