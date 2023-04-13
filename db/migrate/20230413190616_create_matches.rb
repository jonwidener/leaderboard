class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.date :played_on
      t.references :player, null: true, foreign_key: true
      t.integer :lives

      t.timestamps
    end
  end
end
