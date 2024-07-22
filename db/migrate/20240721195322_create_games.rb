class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.date :played_on
      t.references :winner, null: false, foreign_key: { to_table: :players }

      t.timestamps
    end
  end
end
