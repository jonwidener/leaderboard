class AddMatchesPlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :matches_players do |t|
      t.references :match
      t.references :player

      t.timestamps
    end
  end
end
