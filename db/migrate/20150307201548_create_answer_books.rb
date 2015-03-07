class CreateAnswerBooks < ActiveRecord::Migration
  def change
    create_table :answer_books do |t|
    	t.belongs_to :player
    	t.belongs_to :question
    	t.belongs_to :answer 	

      t.timestamps
    end
  end
end
