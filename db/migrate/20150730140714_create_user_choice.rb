class CreateUserChoice < ActiveRecord::Migration
   def up 
		 create_table :user_choice do |t|
      t.string :type
      t.string :color
    end
  end
  
  def down
		drop_table :user_choice
  end
end
