class Game < ApplicationRecord
  belongs_to :winner, class_name: "Player"
  has_and_belongs_to_many :players

  validates :winner, presence: true
  validates :players, presence: true
end
