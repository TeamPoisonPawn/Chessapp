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
    color "white"
  end
  factory :game do
    white_player_id 1

  end

  factory :pawn do
    x_pos 1
    y_pos 1
    game_id 1
    active true
    color "black"
    has_moved false
    type 'Pawn'
  end

  factory :king do
    x_pos 3
    y_pos 0
    game_id 1
    active true
    color "black"
    has_moved false
    type 'King'
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
    x_pos 1
    y_pos 1
    type 'Queen'
    active true
  end
end
