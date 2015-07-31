class CreateFavorites < ActiveRecord::Migration
  def up 
    create_table :favorites do |t|
			t.integer :itemid
			t.integer :user_id
    end
  end
  
  def down
    drop_table :favorites
  end
end
