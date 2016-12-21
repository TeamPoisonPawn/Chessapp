class UserGame < ActiveRecord::Base
  belongs_to :game
  belongs_to :user

  def self.white
    scoped.where(color: 'white')
  end
end
