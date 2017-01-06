FactoryGirl.define do
  factory :piece do
    x_pos 0
    y_pos 0
    game_id 1
    active true
  end
  factory :game do
    white_player_id 1

  end
end
