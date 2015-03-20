class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
    	t.integer :friend_id
    	t.integer :player_id
    	t.integer :question_id
    	t.integer :answer_id

      t.timestamps
    end
  end
end
