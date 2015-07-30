class CreateFavorites < ActiveRecord::Migration
  def up 
    create_table :favorites do |t|
      t.string :type
      t.string :brand
      t.string :color
    end
  end
  
  def down
    drop_table :favorites
  end
end
