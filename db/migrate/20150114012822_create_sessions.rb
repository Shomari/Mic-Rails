class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
    	t.belongs_to :players
    	t.belongs_to :players_console

      t.timestamps
    end
  end
end