class CreateSkills < ActiveRecord::Migration
  def up
    create_table :skills do |t|
      t.integer :fighter_id
      t.string :name
      t.integer :level

      t.timestamps
    end
    add_index :skills, :fighter_id
  end
  
  def down
    drop_table :skills
  end
end
