class CreateFights < ActiveRecord::Migration
  def up
    create_table :fights do |t|
      t.integer :first_fighter_id
      t.integer :second_fighter_id
      t.integer :winner_id

      t.timestamps
    end
     add_index :fights, [:first_fighter_id, :second_fighter_id]
  end
  
  def down
    drop_table :fights
  end
end
