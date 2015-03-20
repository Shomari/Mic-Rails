class CreateRecentlyAddeds < ActiveRecord::Migration
  def change
    create_table :recently_addeds do |t|
    	t.integer :player_id
    	t.integer :friend_id

      t.timestamps
    end
  end
end
