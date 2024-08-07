class CreateJoinTableGamesPlayers < ActiveRecord::Migration[7.0]
  def change
    create_join_table :games, :players do |t|
      t.index [:game_id, :player_id]
      t.index [:player_id, :game_id]
    end
  end
end
