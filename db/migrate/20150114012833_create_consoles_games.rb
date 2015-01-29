class CreateConsolesGames < ActiveRecord::Migration
  def change
    create_table :consoles_games do |t|
      t.belongs_to :players
      t.belongs_to :systems

      t.timestamps
    end
  end
end
