FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "dummyemail#{n}@gmail.com"
    end
    password "password"
    password_confirmation "password"
  end

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
  end

  factory :rook do
  end

  factory :bishop do
  end

  factory :knight do
  end

  factory :queen do
  end
end
