class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
    	t.integer :guesser
    	t.integer :player_id
    	

      t.timestamps
    end
  end
end
