class CreateConsolesGames < ActiveRecord::Migration
  def change
    create_table :consoles_games do |t|
    	t.belongs_to :console
    	t.belongs_to :game

      t.timestamps
    end
  end
end
