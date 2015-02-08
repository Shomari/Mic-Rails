class CreatePlayersConsoles < ActiveRecord::Migration
  def change
    create_table :players_consoles do |t|
      t.string :gtag
      t.belongs_to :player
      t.belongs_to :console

      t.timestamps
    end
  end
end
