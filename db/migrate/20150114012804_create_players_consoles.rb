class CreatePlayersConsoles < ActiveRecord::Migration
  def change
    create_table :players_consoles do |t|
      t.string :gtag
      t.belongs_to :players
      t.belongs_to :systems

      t.timestamps
    end
  end
end
