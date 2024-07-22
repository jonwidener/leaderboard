class Player < ApplicationRecord
  has_one_attached :avatar
  has_and_belongs_to_many :games

  def wins
    games.where(winner: id).count
  end
end
