class Match < ApplicationRecord
  alias_attribute :winner, :player_id
  has_and_belongs_to_many :players
end
